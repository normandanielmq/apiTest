class Question < ActiveRecord::Base
  validates :test_id, :pregunta, :presence => true
  belongs_to :test
  has_many :answers, :dependent => :restrict
end