class RunsController < ApplicationController

  def new
    @experiment = Experiment.find(params[:experiment_id])
    @image = Image.new
  end

end
