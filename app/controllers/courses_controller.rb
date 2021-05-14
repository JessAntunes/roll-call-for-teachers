class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]


    def index
        if logged_in?
            @courses = Course.ordered_list
        else
            redirect_to "/login"
        end
    end
  
    def new
        if logged_in?
            if params[:lecturer_id]
                find_lecturer
                @course = @lecturer.courses.build
            else
                redirect_to lecturer_path(@lecturer)
            end
        else
            redirect_to "/login"
        end
    end

    def show
        if logged_in? && @course
            if params[:lecturer_id]
                find_lecturer
            end
        else
            redirect_to "/login"
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
                    flash[:notice] = "Course saved successfully."
                    redirect_to lecturer_course_path(@lecturer, @course)
                else
                    redirect_to lecturer_course_path(@course)
                end 
            else
                flash[:notice] = "Please try again."
                render :new
            end

    end 

    def edit 
        if !logged_in? || !@course
            redirect_to "/login"
        end
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
                flash[:notice] = "Update successful."
                redirect_to lecturer_course_path(@lecturer, @course)
            else
                redirect_to lecturer_course_path(@course)
            end 
        else
            flash[:notice] = "Please try again."
            render :edit
        end
    end 

    def destroy
        @course.destroy
        flash[:notice] = "Course deleted successfully."
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
