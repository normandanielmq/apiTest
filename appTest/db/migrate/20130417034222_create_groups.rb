class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :course_id, null: :false
      t.string :cuatrimestre, null: :false
      t.integer :professor_id, null: :false
      t.integer :numero_grupo, null: :false, default: 0

      t.timestamps
    end
  end
end
