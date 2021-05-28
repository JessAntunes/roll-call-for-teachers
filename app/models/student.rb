class Student < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :courses, through: :enrollments
    validates_presence_of :name, :email, :degree
    validates_uniqueness_of :email
    
    def last_first
        full_name = self.name.split(' ')
        "#{full_name[1]}, #{full_name[0]}"
    end

    scope :order_by_abc, -> {order(name: :asc)}
    
end
