class CreateSubQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_questions do |t|
      t.references :answer, :null=>false
      t.string :title, :limit=>150
      t.integer :sub_answers_count, :null=>false, :default=>0
      t.boolean :multi_answer, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
