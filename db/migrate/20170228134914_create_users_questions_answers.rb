class CreateUsersQuestionsAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :users_questions_answers do |t|
      t.references :users_question, :null=>false
      t.references :answer, :null=>false
      t.integer :users_questions_answers_sub_questions_count, :null=>false, :default=>0      
      t.timestamps
    end

    add_foreign_key :users_questions_answers, :users_questions, on_delete: :cascade, on_update: :cascade
    add_foreign_key :users_questions_answers, :answers, on_delete: :cascade, on_update: :cascade
    add_index :users_questions_answers, [:users_question_id, :answer_id], :unique=>true, :name=>'users_qa_unique'
  end
end
