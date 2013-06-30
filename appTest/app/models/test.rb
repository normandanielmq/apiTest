class Test < ActiveRecord::Base
  validates :group_id, :descripcion, :fecha, :estado, :duracion, :total_puntos, :presence => true
  belongs_to :group
  has_many :questions, :dependent => :restrict
  has_many :answers, :dependent => :restrict

  def find_tests_by_student_sql(student_id)
    "select t.*,
      (IFNULL((select sum(a.valor_asignado) from answers a
      where a.test_id = t.id and a.student_id = s.id),0) * t.total_puntos * 1.0 /
      IFNULL((select sum(q.valor) from questions q
      where q.test_id = t.id),0) ) as nota
      from tests t, groups g, matriculas m, students s
      where t.group_id = g.id and g.id = m.group_id
      and m.student_id = s.id
      and s.id = #{student_id}"
  end

  def find_tests_by_professor_sql(professor_id)
    "SELECT t.*
      FROM tests t, groups g
      WHERE t.group_id = g.id
        AND g.professor_id = #{professor_id}"
  end
end
