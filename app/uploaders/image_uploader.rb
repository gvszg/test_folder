# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [600, 600]

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  version :medium do
    process resize_to_fill: [400, 400]
  end

  version :modified, from_version: :thumb do
    process resize_to_fill: [400, 400]
  end
end