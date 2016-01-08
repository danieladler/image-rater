# encoding: utf-8

class ImageFileUploader < CarrierWave::Uploader::Base

  # this gem knows how to shrink image size
  include CarrierWave::MiniMagick

  # path within S3 bucket where image is stored
  # makes a unique path for each image
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [32, 32]
  end

  version :preview do
    process :resize_to_fit => [256, 256]
  end

  version :index do
    process :resize_to_fill => [555, 367, gravity = "center"]
  end

  version :detail do
    process :resize_to_fit => [847, 559]
  end

end
