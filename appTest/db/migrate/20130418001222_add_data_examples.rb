class AddDataExamples < ActiveRecord::Migration
  def up
    execute <<-SQL
    INSERT INTO students (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (20, '105840245', 'Norman', 'Murillo', 'norman@ejemplo.com', 'nmurillo', 1, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO students (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (21, '206980847', 'Elnier', 'Vindas', 'nier@ejemplo.com', 'evindas', 1, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO students (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (22, '205980258', 'Federico', 'De los palotes', 'federico@ejemplo.com', 'fdelospalotes', 0, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
      INSERT INTO students (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (23, '109870524', 'Zacarias', 'Piedras del rio', 'zacarias@ejemplo.com', 'zpiedras', 0, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO professors (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (10, '205690548', 'Bladimir', 'Arroyo Blanco', 'bladimir@ejemplo.com', 'barroyo', 1, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
      INSERT INTO professors (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (11, '208470554', 'Donald', 'Zepeda', 'donald@ejemplo.com', 'dzepeda', 0, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO professors (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (12, '105840841', 'Danilo', 'Vargas', 'danilo@ejemplo.com', 'dvargas', 0, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO professors (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (13, '109870541', 'Mainor', 'Morales', 'mainor@ejemplo.com', 'mmorales', 0, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO professors (id, cedula, nombre, apellidos, email, username, rol, password, created_at, updated_at)
      VALUES (14, '208540544', 'Beachincy', 'Ricura Vega', 'beachincy@ejemplo.com', 'bricura', 0, '202cb962ac59075b964b07152d234b70', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO courses (id, codigo, nombre, descripcion, created_at, updated_at)
      VALUES (30, 'ISW-711', 'Programacion Web 2', 'Ruby on Rails and MS MVC4', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO courses (id, codigo, nombre, descripcion, created_at, updated_at)
      VALUES (31, 'ISW-611', 'Diseno  Web', 'HTML5 y CSS3', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO courses (id, codigo, nombre, descripcion, created_at, updated_at)
      VALUES (32, 'ISW-612', 'Ingenieria en software 1', 'SCRUM', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO courses (id, codigo, nombre, descripcion, created_at, updated_at)
      VALUES (33, 'ISW-712', 'Ingenieria en software 2', 'Nada nuevo', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO courses (id, codigo, nombre, descripcion, created_at, updated_at)
      VALUES (34, 'ISW-713', 'Estadistica y probabilidad', 'Graficos y encuestas', '20130407', '20130407');
    SQL
    execute <<-SQL
    INSERT INTO groups (id, course_id, cuatrimestre, professor_id, numero_grupo, created_at, updated_at)
      VALUES (10, 30, 'I 2013', 10, 1, '20130407', '20130407');
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (100, 10, 20);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (101, 10, 21);
    SQL
    execute <<-SQL
    INSERT INTO groups (id, course_id, cuatrimestre, professor_id, numero_grupo, created_at, updated_at)
      VALUES (11, 30, 'I 2013', 13, 2, '20130407', '20130407');
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (102, 11, 22);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (103, 11, 23);
    SQL
    execute <<-SQL
    INSERT INTO groups (id, course_id, cuatrimestre, professor_id, numero_grupo, created_at, updated_at)
      VALUES (12, 31, 'II 2012', 10, 1, '20130407', '20130407');
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (104, 12, 20);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (105, 12, 21);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (106, 12, 22);
    SQL
    execute <<-SQL
    INSERT INTO groups (id, course_id, cuatrimestre, professor_id, numero_grupo, created_at, updated_at)
      VALUES (13, 32, 'III 2012', 13, 1, '20130407', '20130407');
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (107, 13, 20);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (108, 13, 23);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (109, 13, 22);
    SQL
    execute <<-SQL
    INSERT INTO groups (id, course_id, cuatrimestre, professor_id, numero_grupo, created_at, updated_at)
      VALUES (14, 33, 'I 2013', 14, 1, '20130407', '20130407');
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (110, 14, 21);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (111, 14, 22);
    SQL
    execute <<-SQL
    INSERT INTO groups (id, course_id, cuatrimestre, professor_id, numero_grupo, created_at, updated_at)
      VALUES (15, 34, 'I 2013', 11, 1, '20130407', '20130407');
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (112, 15, 21);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (113, 15, 22);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (114, 15, 20);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (115, 15, 23);
    SQL
    execute <<-SQL
    INSERT INTO groups (id, course_id, cuatrimestre, professor_id, numero_grupo, created_at, updated_at)
      VALUES (16, 31, 'I 2012', 12, 2, '20130407', '20130407');
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (116, 16, 21);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (117, 16, 22);
    SQL
    execute <<-SQL
        INSERT INTO matriculas (id, group_id, student_id) VALUES (118, 16, 20);
    SQL
  end

  def down
    Professor.delete_all
    Student.delete_all
    Course.delete_all
    Group.delete_all
  end
end