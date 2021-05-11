class Student < ApplicationRecord
    has_many :enrollments
    has_many :courses, through: :enrollments
    
    def last_first
        full_name = self.name.split(' ')
        "#{full_name[1]}, #{full_name[0]}"
    end
    
end
