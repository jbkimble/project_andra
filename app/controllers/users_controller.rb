class UsersController < ApplicationController
  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:success] = "Welcome #{@user.first_name} your account was successfully created!"
      session[:user_id] = @user.id
      redirect_to root_path
      # redirect_to take_photo_path
    else
      flash[:failure] = "Your account creation failed, please try again."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:success] = "You have successfully updated your account"
      redirect_to user_path(@user)
    else
      flash[:failure] = "Your account failed to update"
      redirect_to user_path(@user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:id, :first_name, :email, :password, :password_confirmation)
    end
end
