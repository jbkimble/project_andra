class PhotosController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
  end

  private

    def image_params
      params.require(:image).permit(:id, :image)
    end
end
