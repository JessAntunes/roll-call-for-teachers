class EnrollmentsController < ApplicationController
    before_action :find_enrollment, only: [:show, :edit, :update, :destroy]
  
    def new
        flash[:error] = "Please login."
        redirect_to "/"
    end

    def show
        if !logged_in?
            flash[:error] = "Please login."
            redirect_to "/"
        end
        @lecturer = @enrollment.course.lecturer
    end

    def index
        flash[:error] = "Please login."
        redirect_to "/"
    end

    # def create
    #     @enrollment = Enrollment.new(enrollment_params)
    #     if @enrollment.save
    #         redirect_to student_path(@enrollment.student)
    #     else
    #         render :new
    #     end
    # end 

    def edit
        if logged_in? && @enrollment
            @lecturer = @enrollment.course.lecturer
        else
            flash[:error] = "Please login."
            redirect_to "/"
        end
    end 
  
    def update
        @enrollment.update(enrollment_params)
        if @enrollment.save
            redirect_to student_path(@enrollment.student)
        else
            flash[:error] = "Please try again."
            render :edit
        end 
    end

    def destroy
        @enrollment.destroy
        flash[:error] = "Deleted Successfully."
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
