class SessionsController < ApplicationController

    def new
    end
  
    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:danger] = 'Invalid email/password combination' 
        render 'new'
      end
    end
  
    def destroy
      session.clear
      redirect_to login_path
    end
    
end
