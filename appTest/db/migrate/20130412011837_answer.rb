class Answer < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.integer :student_id, :null => :false
      t.integer :question_id, :null => :false
      t.text :respuesta
      t.integer :valor_asignado, :null => :false, :default => 0
    end
  end

  def down
    drop_table :answers
  end
end
