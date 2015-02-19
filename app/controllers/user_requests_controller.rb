class UserRequestsController < ApplicationController

  def create
    @user_request = UserRequest.new(user_request_params)
    if @user_request.save
      UserRequestMailer.send_request(@nearest_office, @user_request)
    end

    redirect_to :back
  end

  private

  def user_request_params
    params.require(:user_request).permit(:email, :phone, :file_attachment)
  end
end