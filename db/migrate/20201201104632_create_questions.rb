class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :branch, :null => false
      t.references :question_category, :null=>false
      t.string :title, :null=>false, :limit=>255
      t.integer :answers_count, :null=>false, :default=>0
      t.boolean :multi_answer, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
