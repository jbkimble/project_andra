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
    if @image.save
      flash[:success] = "Great photo!"

      respond_to do |format|
        format.js
      end
      # redirect_to new_experiment_run_path(experiment.id)
      # redirect_to experiment_run_path(@image.experiment)
    else
      flash[:failure] = "Something went wrong, please try again."
      # redirect_to take_photo_path
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
