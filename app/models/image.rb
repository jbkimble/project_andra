class Image < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

  belongs_to :experiment
end
