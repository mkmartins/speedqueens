class HomeTeacher < ActiveRecord::Base
  has_many :families
  acts_as_votable 
end
