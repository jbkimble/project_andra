class SessionsController < ApplicationController
  def destroy
    session.clear
    # flash[:success] = "Successfully Logged Out."
    redirect_to root_path
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      # flash[:success] =  "Welcome back #{@user.first_name}!"
      session[:user_id] = @user.id
      redirect_to experiments_path
    else
      redirect_to login_path
      flash[:failure] = "Login failed, please try again."
    end
  end
end
