# == Schema Information
#
# Table name: user_requests
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  phone           :string(255)
#  file_attachment :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class UserRequest < ActiveRecord::Base
  mount_uploader :file_attachment, FileAttachmentUploader
end
