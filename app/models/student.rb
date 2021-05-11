class Student < ApplicationRecord
    has_many :enrollments
    has_many :courses, through: :enrollments
    
    def last_first
        full_name = self.name.split(' ')
        "#{fullname[1]}, #{fullname[0]}"
    end
    
end
