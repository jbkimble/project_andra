class EmotionData

  def self.top_emotion(image_path)
    emotion_data = EmotionService.new(image_path).get_emotion_data
    emotion_scores = emotion_data[0][:scores]
    emotion_scores.delete(:neutral)
    top_emotion_data = emotion_scores.max_by{|k,v| v}
    top_emotion_data[0].to_s
  end

  def self.get_emotions(image_path)
    emotion_data = EmotionService.new(image_path).get_emotion_data
    emotion_data[0][:scores]
  end
end
