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

  def  self.chart_top_emotion(emotion_data)
    emotion_data.max_by{|k,v| v}[0].to_s
  end

  def self.chart_data(emotion_data)
    highest_emotion = emotion_data.max_by{|k,v| v}[0].to_s

    if highest_emotion == "anger"
      return (25..30).to_a.sample
    elsif highest_emotion == "contempt"
      return (20..25).to_a.sample
    elsif highest_emotion == "disgust"
      return (10..20).to_a.sample
    elsif highest_emotion == "fear"
      return (1..10).to_a.sample
    elsif highest_emotion == "happiness"
      return (90..100).to_a.sample
    elsif highest_emotion == "sadness"
      return (30..40).to_a.sample
    elsif highest_emotion == "neutral"
      return (60..80).to_a.sample
    else
      return (80..90).to_a.sample
    end

  end
end
