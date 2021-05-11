class Course < ApplicationRecord
  belongs_to :lecturer
  has_many :enrollments
  has_many :students, through: :enrollments


  
end
