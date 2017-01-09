class RunsController < ApplicationController

  # def create
  #   byebug
  #   @image = Image.new(image_params)
  # end

  def new
    @experiment = Experiment.find(params[:experiment_id])
    @image = Image.new
  end

end
