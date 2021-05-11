class Lecturer < ApplicationRecord
    has_secure_password
    has_many :courses
    validates_presence_of :first_name, :last_name, :email
    validates_uniqueness_of :email

    def fullname
        "#{self.first_name} #{self.last_name}"
    end

end
