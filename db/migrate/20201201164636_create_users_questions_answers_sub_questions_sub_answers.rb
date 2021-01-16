class CreateUsersQuestionsAnswersSubQuestionsSubAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :users_questions_answers_sub_questions_sub_answers do |t|
      t.references :users_questions_answers_sub_question, :null=>false
      t.references :sub_answer, :null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end

    add_foreign_key :users_questions_answers_sub_questions_sub_answers, :users_questions_answers_sub_questions, on_delete: :cascade, on_update: :cascade
    add_foreign_key :users_questions_answers_sub_questions_sub_answers, :sub_answers, on_delete: :cascade, on_update: :cascade
    add_index :users_questions_answers_sub_questions_sub_answers, [:users_questions_answers_sub_question_id, :sub_answer_id], :unique=>true, :name=>'users_sub_qa_unique'
  end
end
