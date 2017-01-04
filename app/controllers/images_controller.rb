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
    @image = Image.new(user_id: current_user.id)
    @image.image = image_params[:image]
    if @image.save
      # flash[:success] = "Great photo!"
      redirect_to emotion_path
    else
      flash[:failure] = "Something went wrong, please try again."
      redirect_to take_photo_path
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
