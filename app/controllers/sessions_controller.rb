class SessionsController < ApplicationController

    def new
    end
  
    def create
      @lecturer = Lecturer.find_by(email: params[:email])
      if @lecturer && @lecturer.authenticate(params[:password])
        session[:lecturer_id] = @lecturer.id
        redirect_to @lecturer
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
