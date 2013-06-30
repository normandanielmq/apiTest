#encoding: utf-8
class PoblarDatosDeTest < ActiveRecord::Migration
  def up
    execute <<-SQL
      INSERT INTO tests (id, group_id, descripcion, fecha, estado, duracion, total_puntos, created_at, updated_at)
        VALUES (10, 10, 'Evaluación #1 sobre web services', '20130401', 0, 20, 5, '20130401', '20130401');
    SQL
    execute <<-SQL
      INSERT INTO questions (id, test_id, pregunta, respuesta, valor)
        VALUES (20, 10, '¿Qué es un web service?', 'Recurso publicado en la red que devuelve datos o ejecuta acciones a peticiones cliente.', 2);
    SQL
    execute <<-SQL
      INSERT INTO questions (id, test_id, pregunta, respuesta, valor)
        VALUES (21, 10, '¿Dos tipos de web service?', 'Recurso publicado en la red que devuelve datos o ejecuta acciones a peticiones cliente.', 4);
    SQL
    execute <<-SQL
      INSERT INTO questions (id, test_id, pregunta, respuesta, valor)
        VALUES (22, 10, '¿Cuál es la mitad de uno?', 'El ombligo.', 4);
    SQL
    execute <<-SQL
      INSERT INTO questions (id, test_id, pregunta, respuesta, valor)
        VALUES (23, 10, '¿Hasta dónde entra un perro en una cancha?', 'Hasta la mitad porque la otra mitad va de salida', 2);
    SQL
    execute <<-SQL
      INSERT INTO questions (id, test_id, pregunta, respuesta, valor)
        VALUES (24, 10, '¿Por qué la gallina cruzó la calle?', 'Para llegar al otro lado.', 3);
    SQL
  end

  def down
    execute <<-SQL
      delete from tests;
    SQL
    execute <<-SQL
      delete from questions;
    SQL
  end
end
