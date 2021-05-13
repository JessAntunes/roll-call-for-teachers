class SessionsController < ApplicationController

    def new
    end
    
    
    def create
      if  params[:email]
        @lecturer = Lecturer.find_by(email: params[:email])
        if @lecturer && @lecturer.authenticate(params[:password])
          session[:lecturer_id] = @lecturer.id
          redirect_to @lecturer
        else
          flash[:danger] = 'Invalid email/password combination' 
          render :new
        end
      else
        @lecturer = Lecturer.find_or_create_by(uid: auth['uid']) do |l|
          l.first_name = auth['info']['name'].split(' ')[0]
          l.last_name = auth['info']['name'].split(' ')[1]
          l.email = auth['info']['email']
        end
        session[:lecturer_id] = @lecturer.id
        redirect_to @lecturer
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

end
