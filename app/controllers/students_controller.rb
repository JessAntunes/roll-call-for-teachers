class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :edit, :update, :destroy]

    def index
        if logged_in?
            @students = Student.all
        else
            redirect_to "/login"
        end
    end
  
    def new
        if !logged_in?
            redirect_to "/login"
        end
    end

    def show
        if !logged_in?
            redirect_to "/login"
        end
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            render :new
        end
    end 

    def edit 
        if !logged_in?
            redirect_to "/login"
        end
    end 
  
    def update
        @student.update(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            render :edit
        end 
    end

    def delete
        @student.destroy
        redirect_to students_path
    end

    private

    def student_params
        params.require(:student).permit(:name, :email, :degree)
    end 

    def find_student
        @student = Student.find_by_id(params[:id])
    end 

end
