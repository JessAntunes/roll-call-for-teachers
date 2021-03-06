class LecturersController < ApplicationController
    before_action :find_lecturer, only: [:show, :edit, :update, :destroy]
    
  
    def new
        @lecturer = Lecturer.new  
    end

  
    def create
        @lecturer = Lecturer.new(lecturer_params)
        if @lecturer.save
            session[:lecturer_id] = @lecturer.id
            redirect_to @lecturer
        else
            render :new
        end
    end 

    def show
        if !logged_in?
            flash[:error] = "Please login."
            redirect_to "/"
        end
    end

    def index
        redirect_to "/wrong_page"
    end
  
    def edit 
        if !@lecturer || @lecturer != current_lecturer
            redirect_to "/wrong_page"
        end
    end 
  
    def update
        @lecturer.update(lecturer_params)
        if @lecturer.save
            flash[:notice] = "Profile updated successfully."
            redirect_to @lecturer
        else
            flash[:error] = "Please try again."
            render :edit
        end
    end

    def destroy
        @lecturer.destroy
        flash[:notice] = "Account deleted successfully."
        redirect_to "/"
    end

    private

    def lecturer_params
        params.require(:lecturer).permit(:first_name, :last_name, :email, :password)
    end 

    def find_lecturer
        @lecturer = Lecturer.find_by_id(params[:id])
    end 
end
