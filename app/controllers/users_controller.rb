class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have succesfully sign up'
      redirect_to root_path
    else
      flash[:notice] = 'You have succesfully sign up'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
  
end
