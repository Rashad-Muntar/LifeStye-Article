class SessionsController < ApplicationController

    def new
      @categories = Category.all
    end
  
    def create
      user = User.find_by(name: params[:session][:name].downcase)
       if session[:user_id] = user.id
        session[:user_id] = user.id
        redirect_to root_path
       else
        render new
       end
      end
   
    def destroy
      session[:user_id] = nil
      flash = 'You have succesffuly logged out'
      redirect_to root_path
    end
  
    
  end
  