class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]


    def index
        @courses = Course.all
    end
  
    def new
        if params[:lecturer_id]
            find_lecturer
            @course = @lecturer.courses.build
        else
            redirect_to lecturer_path(@lecturer)
        end
    end

    def show
        if params[:lecturer_id]
            find_lecturer
        end
    end

    def create
        if params[:lecturer_id]
            find_lecturer
            @course = @lecturer.courses.build(course_params)
        else
            redirect_to lecturer_path(@lecturer)
        end
       
        if @course.save 
            if @lecturer
                redirect_to lecturer_course_path(@lecturer, @course)
            else
                redirect_to lecturer_course_path(@course)
            end 
        else
            render :new
        end
    end 

    def edit 
        
    end 
  
    def update
        if params[:lecturer_id]
            find_lecturer
            @course = @lecturer.courses.build(course_params)
        else
            redirect_to lecturer_path(@lecturer)
        end
    
        if @course.update(course_params)
            if @lecturer
                redirect_to lecturer_course_path(@lecturer, @course)
            else
                redirect_to lecturer_course_path(@course)
            end 
        else
            render :edit
        end
    end 

    def destroy
        @course.destroy
        redirect_to lecturer_path(current_lecturer)
    end

    private

    def course_params
        params.require(:course).permit(:subject, :lecturer_id, :day, :student_ids => [])
    end 

    def find_course
        @course = Course.find_by_id(params[:id])
    end

    def find_lecturer
        @lecturer = Lecturer.find_by_id(params[:lecturer_id])
    end

end
