# class EmotionsController < ApplicationController
#   def show
#     photo = current_user.images.last.image.file.file
#     raw_top_emotion = EmotionData.top_emotion(photo)
#     @top_emotion = AndraLanguageHelper.andra_talk(raw_top_emotion)
#     @andra_image_path = AndraEmojiHelper.find_expression(raw_top_emotion)
#   end
#
# end
