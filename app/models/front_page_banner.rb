class FrontPageBanner < ActiveRecord::Base
  mount_uploader :image, FrontPageBannerUploader
end
