class StudentsController < ApplicationController

    def index
        @students = Student.all
    end
  
    def new
    end

    def show
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
    end 
  
    def update
        @student.update(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            render :edit
        end 
    end

end
