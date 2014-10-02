class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :auto_select_office

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end

  def auto_select_office
    unless session[:office_id]
      user_ip = request.remote_ip
      if Rails.env.development?
        user_coordinates = [55.755826, 37.6173] # Moscow coordinates (default)
      else
        user_coordinates = Geocoder.coordinates(user_ip)
      end

      # office_distances = []
      Office.find_each do |office|
        office_distances << {
          id: office.id,
          distance: Geocoder::Calculations.distance_between(user_coordinates,
                                                            [office.latitude, office.longitude])
        }
      end

      nearest_office = office_distances
                        .delete_if { |office| office[:distance].nan? || office[:distance].nil? }
                        .min_by { |office| office[:distance] }

      session[:office_id] = nearest_office[:id] if nearest_office
    end

    @nearest_office = Office.find_by_id(session[:office_id])
  end
end
