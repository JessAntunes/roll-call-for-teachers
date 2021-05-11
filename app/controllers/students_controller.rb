class StudentsController < ApplicationController

    def index
        @students = Student.all
    end
  
    def new
    end

    def show
    end

end
