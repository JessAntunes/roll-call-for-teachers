class Course < ApplicationRecord
  belongs_to :student
  belongs_to :lecturer
end
