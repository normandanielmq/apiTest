class CreateMatriculas < ActiveRecord::Migration
  def up
  	execute <<-SQL
  		CREATE TABLE matriculas (
  			id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  			group_id INTEGER NOT NULL REFERENCES groups(id) ON DELETE RESTRICT,
  			student_id INTEGER NOT NULL REFERENCES students(id) ON DELETE RESTRICT,
  			CONSTRAINT pk_matriculas UNIQUE (group_id, student_id)
  			);
		SQL
  end

  def down
  	drop_table :matriculas
  end
end
