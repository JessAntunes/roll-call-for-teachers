class SessionsController < ApplicationController
  skip_before_action :verified_lecturer, only: [:new, :create]
    def new
    end
    
    
    def create
      @lecturer = Lecturer.new(lecturer_params)
      if @lecturer.save 
          session[:lecturer_id] = @lecturer.id
          redirect_to movies_path
      else 
          @error = @lecturer.errors.full_messages
          render :new
      end
    end

    def facebook
      @lecturer = Lecturer.find_or_create_by(email: auth["info"]["email"]) do |lecturer| 
          lecturer.password =  SecureRandom.hex(10)
      end 
      if @lecturer && @lecturer.id
          session[:lecturer_id] = @lecturer.id
          redirect_to movies_path 
      else 
          redirect_to "/login"
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
