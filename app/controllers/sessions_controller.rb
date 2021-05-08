class SessionsController < ApplicationController

    def new
      @categories = Category.all
    end
  
    def create
      @categories = Category.all
<<<<<<< HEAD
      user = User.find_by(name: params[:session][:name].downcase)
        session[:user_id] = user.id
        redirect_to root_path
=======
      user = User.find_by(name: params[:session][:name])
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = 'You have succesffuly logged in'
          redirect_to root_path
      else
        flash[:notice] = 'Ooops something went wrong try again!'
          render 'new'
>>>>>>> c20415721172eb606513fd6d1227d237a0a4be3c
      end
  end
   
    def destroy
      session[:user_id] = nil
      flash[:notice] = 'You have succesffuly logged out'
      redirect_to root_path
    end
  
    
  end
  