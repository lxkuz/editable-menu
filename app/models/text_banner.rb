class TextBanner < ActiveRecord::Base
  mount_uploader :image, TextBannerUploader
end
