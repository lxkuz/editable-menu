class DealerRequest < ActiveRecord::Base
  mount_uploader :file_attachment, FileAttachmentUploader
end
