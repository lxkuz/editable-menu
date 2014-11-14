# encoding: utf-8

class TextBannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :banner3x3 do
    process :resize_to_fill => [300, 300]
  end

  version :banner5x4 do
    process :resize_to_fill => [500, 400]
  end

  version :banner3x4 do
    process :resize_to_fill => [300, 400]
  end

  version :banner4x3 do
    process :resize_to_fill => [400, 300]
  end


end
