class Course < ApplicationRecord
  belongs_to :lecturer
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  accepts_nested_attributes_for :students, reject_if: :all_blank

  
end
