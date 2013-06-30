#encoding: utf-8
class AgregarDatosCalificar < ActiveRecord::Migration
  def up
    execute <<-SQL
      INSERT INTO tests (id, group_id, descripcion, fecha, estado, duracion, total_puntos, created_at, updated_at)
        VALUES (12, 15, 'test para calificar', '2013-04-01', 2, 20, 5, '2013-04-01', '2013-04-01');
    SQL
    execute <<-SQL
      INSERT INTO questions (id, test_id, pregunta, respuesta, valor)
        VALUES (31, 12, '¿Dos mas dos es 4?', 'Depende de la posicion', 4);
    SQL
    execute <<-SQL
      INSERT INTO questions (id, test_id, pregunta, respuesta, valor)
        VALUES (32, 12, '¿Eres princeso?', 'jajaja', 5);
    SQL
    execute <<-SQL
      INSERT INTO answers (id, student_id, question_id, respuesta, valor_asignado,test_id)
        VALUES (1, 20, 31,'si', 0,12);
    SQL  
    execute <<-SQL
    INSERT INTO answers (id, student_id, question_id, respuesta, valor_asignado,test_id)
    VALUES (2, 20, 32,'quizas', 0,12);
    SQL
    execute <<-SQL
      INSERT INTO answers (id, student_id, question_id, respuesta, valor_asignado,test_id)
        VALUES (3, 21, 31,'No', 0,12);
    SQL
    execute <<-SQL
      INSERT INTO answers (id, student_id, question_id, respuesta, valor_asignado,test_id)
        VALUES (4, 21, 32,'se', 0,12);
    SQL
    execute <<-SQL
      INSERT INTO answers (id, student_id, question_id, respuesta, valor_asignado,test_id)
        VALUES (5, 22, 32,'Quizas', 0,12);
    SQL   
    execute <<-SQL
    INSERT INTO answers (id, student_id, question_id, respuesta, valor_asignado,test_id)
    VALUES (6, 22, 31,'A veces', 0,12);
    SQL
  end
  def down
    execute <<-SQL
    DELETE FROM  answers;
    SQL
    execute <<-SQL
    DELETE FROM  questions WHERE id > 30;
    SQL
    execute <<-SQL
    DELETE FROM  test WHERE id = 12;
    SQL
  end
end
