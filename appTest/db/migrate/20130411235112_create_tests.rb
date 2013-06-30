class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :group_id, null: :false
      t.string :descripcion, null: :false
      t.datetime :fecha, null: :false
      t.integer :estado, default: 0
      t.integer :duracion, default: 0
      t.integer :total_puntos, default: 0
      t.text :comentarios

      t.timestamps
    end
  end
end
