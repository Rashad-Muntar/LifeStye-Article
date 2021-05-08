class SessionsController < ApplicationController

    def new
      @categories = Category.all
    end
  
    def create
      @categories = Category.all
      user = User.find_by(name: params[:session][:name].downcase)
        session[:user_id] = user.id
        redirect_to root_path
      end
   
    def destroy
      session[:user_id] = nil
      flash = 'You have succesffuly logged out'
      redirect_to root_path
    end
  
    
  end
  