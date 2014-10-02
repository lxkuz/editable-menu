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

      nearest_office = Office.all
                                .select { |office| !office.distance_to_user(user_ip).nan? }
                                .min_by { |office| office.distance_to_user(user_ip) }

      session[:office_id] = nearest_office.try(:id)
    end
    @nearest_office = nearest_office || Office.find_by_id(session[:office_id])
  end
end
