class Student < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :courses, through: :enrollments
    
    def last_first
        full_name = self.name.split(' ')
        "#{full_name[1]}, #{full_name[0]}"
    end

    scope :order_by_abc, -> {order(name: :asc)}
    
end
