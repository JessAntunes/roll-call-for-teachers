class Course < ApplicationRecord
  belongs_to :student
  belongs_to :lecturer

  def students
    list = []
    self.student.each do |s|
      list << Student.find_by_id(s)
    end
    list
  end
  
end
