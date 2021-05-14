class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :edit, :update, :destroy]

    def index
        if logged_in?
            @students = Student.all
        else
            flash[:error] = "Please login."
            redirect_to "/"
        end
    end
  
    def new
        if logged_in?
            @student = Student.new
        else
            flash[:error] = "Please login."
            redirect_to "/"
        end
    end

    def show
        if !logged_in? || !@student
            flash[:error] = "Please login."
            redirect_to "/wrong_page"
        end
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            flash[:error] = "Please try again."
            render :new
        end
    end 

    def edit 
        if !logged_in? || !@student
            redirect_to "/wrong_page"
        end
    end 
  
    def update
        @student.update(student_params)
        if @student.save
            flash[:notice] = "Student updated successfully."
            redirect_to student_path(@student)
        else
            flash[:notice] = "Please try again."
            render :edit
        end 
    end

    def delete
        @student.destroy
        flash[:notice] = "Student has been deleted successfully."
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
