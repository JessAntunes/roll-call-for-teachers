class Student < ApplicationRecord
    has_many :courses
    has_many :lecturers, through: :courses
    
    def last_first
        "#{self.last_name}, #{self.first_name}"
    end
    
end
