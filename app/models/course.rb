class Course < ApplicationRecord
  belongs_to :lecturer
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  validates_presence_of :subject, :day
  accepts_nested_attributes_for :students, reject_if: :all_blank

  scope :order_by_subject, -> {order(subject: :asc)}
  scope :order_by_day, -> {order(day: :asc)}
  
end


