class ExperimentsController < ApplicationController

  def index
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.user_id = current_user.id
    if @experiment.save
      redirect_to new_experiment_run_path(@experiment.id)
    else
      flash[:failure] = "Your experiment failed to be created"
      redirect_to new_experiment_path
    end
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  private

    def experiment_params
      params.require(:experiment).permit(:id, :title, :hypothesis, :description)
    end
end
