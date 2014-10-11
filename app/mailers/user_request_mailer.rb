class UserRequestMailer < ActionMailer::Base

  def self.send_request(office, user_request)
    @recipients = office.user_request_recipients.delete(' ').split(',')
    @recipients.each do |recipient_mail|
      send_new_request(recipient_mail, user_request).deliver
    end
  end

  def send_new_request(recipient_mail, user_request)
    @user_request = user_request
    @user_request_url = admin_user_request_url(@user_request)

    if @user_request.file_attachment.present?
      full_url = URI( root_url )
      full_url.path = @user_request.file_attachment.url
      @file_url = full_url.to_s
    end

    mail(from: @user_request.email, to: recipient_mail, subject: 'Новая заявка')
  end
end
