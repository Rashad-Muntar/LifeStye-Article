class UsersController < ApplicationController
  def new
    @categories = Category.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = 'password'
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You have succesfully sign up'
      redirect_to root_path
    else
      flash[:notice] = 'Ooops something went wrong try again!'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
