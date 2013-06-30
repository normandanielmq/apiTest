# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130422063624) do

  create_table "answers", :force => true do |t|
    t.integer "student_id"
    t.integer "question_id"
    t.text    "respuesta"
    t.integer "valor_asignado", :default => 0
    t.integer "test_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "course_id"
    t.string   "cuatrimestre"
    t.integer  "professor_id"
    t.integer  "numero_grupo", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "matriculas", :force => true do |t|
    t.integer "group_id",   :null => false
    t.integer "student_id", :null => false
  end

  add_index "matriculas", ["group_id", "student_id"], :name => "sqlite_autoindex_matriculas_1", :unique => true

  create_table "professors", :force => true do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellidos"
    t.string   "password"
    t.string   "username"
    t.integer  "rol"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer "test_id"
    t.text    "pregunta"
    t.text    "respuesta"
    t.integer "valor",      :default => 0
    t.integer "calificada", :default => 0
  end

  create_table "students", :force => true do |t|
    t.string   "nombre"
    t.string   "username"
    t.string   "apellidos"
    t.string   "cedula"
    t.string   "password"
    t.string   "email"
    t.integer  "rol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tests", :force => true do |t|
    t.integer  "group_id"
    t.string   "descripcion"
    t.datetime "fecha"
    t.integer  "estado",       :default => 0
    t.integer  "duracion",     :default => 0
    t.integer  "total_puntos", :default => 0
    t.text     "comentarios"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
