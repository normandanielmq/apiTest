class Course < ActiveRecord::Base
  validates :codigo, :nombre, :presence=>true
  has_many :groups, :dependent => :restrict
  has_many :professors, :through => :groups
end
