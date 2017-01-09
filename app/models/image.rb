class Image < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

  belongs_to :experiment

  def the_top_emotion
    image_as_hash = attributes
    image_as_hash.delete("created_at")
    image_as_hash.delete("updated_at")
    image_as_hash.delete("id")
    image_as_hash.delete("image")
    image_as_hash.delete("experiment_id")
    result = image_as_hash.max_by{|k,v| v.to_f}
    result[0]
  end
end
