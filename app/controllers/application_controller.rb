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

  def manual_select_office
    session[:office_id] = params[:office_id]

    redirect_to(session[:previous_url] || root_path)
  end

  def auto_select_office
    unless session[:office_id]
      nearest_office = Geocoding::NearestOfficeFinder.new(request.remote_ip).nearest_office
      session[:office_id] = nearest_office.try(:id)
    end

    @nearest_office = nearest_office || Office.find_by(id: session[:office_id])
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_root_path
    else
      session[:previous_url] || root_path
    end
  end
end
