class SessionsController < ApplicationController
  
    def new
    end
    
    def create
        @lecturer = Lecturer.find_by(email: params[:email])
      if @lecturer && @lecturer.authenticate(params[:password])
        session[:lecturerr_id] = @lecturer.id
        redirect_to lecturer_path(@lecturer)
      else
        flash[:notice] = "Email and/or Password are invalid. Please try again."
        redirect_to '/login'
      end 
    end

    def google
      @lecturer = Lecturer.find_or_create_by(email: auth["info"]["email"]) do |lecturer| 
          lecturer.password =  SecureRandom.hex(10)
          lecturer.first_name = auth["info"]["first_name"]
          lecturer.last_name = auth["info"]["last_name"]
      end 
      if @lecturer && @lecturer.id
          session[:lecturer_id] = @lecturer.id
          redirect_to lecturer_path(@lecturer) 
      else
         flash[:notice] = "Something went wrong."
          redirect_to "/"
      end 
  end 
  
    def destroy
      session.clear
      redirect_to "/"
    end

    private

  def auth
    request.env['omniauth.auth']
  end

  def lecturer_params
    params.require(:lecturer).permit(:email, :password)
  end 

end
