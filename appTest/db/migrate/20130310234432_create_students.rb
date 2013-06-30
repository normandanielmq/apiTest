class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :nombre
      t.string :username
      t.string :apellidos
      t.string :cedula
      t.string :password
      t.string :email
      t.integer :rol

      t.timestamps
    end
  end
end
