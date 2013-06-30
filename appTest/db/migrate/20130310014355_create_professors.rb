class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellidos
      t.string :password
      t.string :username
      t.integer :rol
      t.string :email
      t.timestamps
    end
  end
end
