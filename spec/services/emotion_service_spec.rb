require 'rails_helper'

describe EmotionService do
  context '#get_emotion_data' do
    it 'Returns parsed emotion json' do
      VCR.use_cassette("#emotions") do
        emotion_data = EmotionService.new('/Users/JonKimble/turing/3module/projects/andra/public/uploads/image/image/6/file.jpeg').get_emotion_data
        emotion_data = emotion_data[0][:scores]

        expect(emotion_data).to have_key(:anger)
        expect(emotion_data).to have_key(:fear)
        expect(emotion_data).to have_key(:happiness)
      end
    end
  end
end
