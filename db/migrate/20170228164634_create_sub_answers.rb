class CreateSubAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :sub_answers do |t|
      t.references :sub_question, :null=>false
      t.string :title, :null=>false, :limit=>60
      t.string :photo, :limit=>100
      t.boolean :has_custom, :null=>false, :default=>false
      t.boolean :default, :null=>false, :default=>false
      t.boolean :only, :null=>false, :default=>false      
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    add_foreign_key :sub_answers, :sub_questions, on_delete: :cascade, on_update: :cascade
    add_index :sub_answers, [:sub_question_id,:title], :unique=>true, :name=>'sub_answers_unique'
  end
end
