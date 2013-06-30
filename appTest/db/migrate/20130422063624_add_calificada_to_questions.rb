class AddCalificadaToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :calificada, :integer, :null => :false, :default => 0
  end
end
