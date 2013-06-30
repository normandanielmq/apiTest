class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :codigo
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
