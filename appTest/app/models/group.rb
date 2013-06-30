class Group < ActiveRecord::Base
  validates :course_id, :cuatrimestre, :professor_id,
  					:numero_grupo, :presence=>true
  belongs_to :course
  belongs_to :professor
  has_many :matriculas, :dependent => :restrict
  has_many :students, :through => :matriculas
  has_many :tests, :dependent => :restrict
end
