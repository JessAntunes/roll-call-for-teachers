class LecturersController < ApplicationController
    before_action :find_lecturer, only: [:show, :edit, :update, :destroy]
    
  
    def new
        @lecturer = Lecturer.new
    end

    def show
        @current_lecturer
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
        @current_lecturer
        if !@lecturer
            redirect_to wrong_page
        end
    end
  
    def edit 
        if !@lecturer
            redirect_to wrong_page
        end
    end 
  
    def update
        if @lecturer
            @lecturer.update(lecturer_params)
            if @lecturer.errors.any?
                render :edit
            else
                redirect_to @lecturer
            end
        else
            render :edit
        end
    end

    def destroy
        @lecturer.destroy
        redirect_to "/home"
    end

    private

    def lecturer_params
        params.require(:lecturer).permit(:first_name,
                                    :last_name
                                    :email, 
                                    :password, 
                                    )
    end 

    def find_lecturer
        @lecturer = Lecturer.find_by_id(params[:id])
    end 
end
