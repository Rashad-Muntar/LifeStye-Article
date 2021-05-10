class SessionsController < ApplicationController
  def new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have succesffuly logged in'
      redirect_to root_path
    else
      flash[:notice] = 'No username found. Please Sign up!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have succesffuly logged out'
    redirect_to root_path
  end
end
