class Answer < ActiveRecord::Base
  validates :student_id, :question_id, :test_id, :presence => true
  belongs_to :student
  belongs_to :question
  belongs_to :test
end