class EnrollmentsController < ApplicationController
    before_action :find_enrollment, only: [:show, :edit, :update, :destroy]
  
    def new
    end

    def show
        @lecturer = @enrollment.course.lecturer
    end

    def create
        @enrollment = Enrollment.new(enrollment_params)
        if @enrollment.save
            redirect_to student_path(@enrollment.student)
        else
            render :new
        end
    end 

    def edit
        @lecturer = @enrollment.course.lecturer
    end 
  
    def update
        @enrollment.update(enrollment_params)
        if @enrollment.save
            redirect_to student_path(@enrollment.student)
        else
            render :edit
        end 
    end

    def destroy
        @enrollment.destroy
        redirect_to student_path(@enrollment.student)
    end

    private

    def enrollment_params
        params.require(:enrollment).permit(:grade, :course_id, :student_id)
    end 

    def find_enrollment
        @enrollment = Enrollment.find_by_id(params[:id])
    end 


end
