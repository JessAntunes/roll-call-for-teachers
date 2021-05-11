class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]

    def index
        @courses = Course.all
    end
  
    def new
    end

    def show
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            render :new
        end
    end 

    def edit 
    end 
  
    def update
        @course.update(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            render :edit
        end 
    end

    def delete
        @course.destroy
        redirect_to courses_path
    end

    private

    def course_params
        params.require(:course).permit(:subject, :student_id => [], :instructor_id)
    end 

    def find_course
        @course = Course.find_by_id(params[:id])
    end 
end
