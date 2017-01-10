class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    experiment = current_user.experiments.last
    @image = Image.new(experiment_id: experiment.id)
    @image.image = image_params[:image]
    image_emotions = EmotionData.get_emotions(@image.image.file.file)
    @image.anger = image_emotions[:anger]
    @image.contempt = image_emotions[:contempt]
    @image.disgust = image_emotions[:disgust]
    @image.fear = image_emotions[:fear]
    @image.happiness = image_emotions[:happiness]
    @image.neutral = image_emotions[:neutral]
    @image.sadness = image_emotions[:sadness]
    @image.surprise = image_emotions[:surprise]
    @image.top_emotion = EmotionData.chart_top_emotion(image_emotions)
    @image.chart_value = EmotionData.chart_data(image_emotions).to_s
    if @image.save
      flash[:success] = "Great photo!"

      respond_to do |format|
        format.js
      end
      # redirect_to new_experiment_run_path(experiment.id)
      # redirect_to experiment_run_path(@image.experiment)
    else
      flash[:failure] = "Something went wrong, please try again."
      redirect_to root_path
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:id, :image)
    end
end
