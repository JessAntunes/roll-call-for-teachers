class Lecturer < ApplicationRecord
    has_secure_password
    has_many :courses
    has_many :students, through: :courses

    
end
