class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]
    before_action :find_lecturer

    def index
        @courses = Course.all
    end
  
    def new
    end

    def show
    end

    def create
        @course = Course.new(course_params)
        binding.pry
        if @course.save
            redirect_to @course
        else
            render :new
        end
    end 

    def edit 
    end 
  
    def update
        @course.update(course_params)
        if @course.save
            redirect_to @course
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
        params.require(:course).permit(:subject, student_id:[], :lecturer_id, :day)
    end 

    def find_course
        @course = Course.find_by_id(params[:id])
    end

    def find_lecturer
        @lecturer = Lecturer.find_by_id(params[:lecturer_id])
    end
end
