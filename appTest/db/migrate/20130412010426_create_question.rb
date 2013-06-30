class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :test_id, :null => :false
      t.text :pregunta, :null => :false
      t.text :respuesta
      t.integer :valor, :null => :false, :default => 0
    end
  end
end
