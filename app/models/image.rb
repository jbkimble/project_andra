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

  def self.line_data(images)
    result = images.map do |image|
      # { time: image.created_at.strftime("%c"), value: image.chart_value }
      { "time" => image.created_at.strftime("%Y-%m-%d %H:%M:%S"), "value" => image.chart_value }
    end
  end
end

# image.created_at.strftime("%I:%M:%S").sub(/^[0]*/,"")
