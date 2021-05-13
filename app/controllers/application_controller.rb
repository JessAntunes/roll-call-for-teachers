class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?
    helper_method :current_lecturer

    def home
        render "/home"
    end

    def wrong_page
        render "/wrong_page"
    end




    def current_lecturer
        Lecturer.find_by_id(session[:lecturer_id])
    end
    
    def logged_in?
        !current_lecturer.nil?
    end

end
