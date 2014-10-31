class OfficeSlide < ActiveRecord::Base
  mount_uploader :image, OfficeSlideUploader
  belongs_to :office
end
