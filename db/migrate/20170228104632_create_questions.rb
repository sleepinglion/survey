class CreateQuestions < ActiveRecord::Migration[4.2]
  def change
    create_table :questions do |t|
      t.references :question_category, :null=>false
      t.string :title, :null=>false, :limit=>255
      t.integer :answers_count, :null=>false, :default=>0
      t.boolean :multi_answer, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    add_foreign_key :questions, :question_categories, on_delete: :cascade, on_update: :cascade
  end
end
