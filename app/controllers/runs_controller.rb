class RunsController < ApplicationController

  def index
    @experiment = Experiment.find(params[:experiment_id])
    @image = Image.new
  end

end
