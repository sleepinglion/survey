class CreateUsersQuestionsAnswersSubQuestions < ActiveRecord::Migration[4.2]
  def change
    create_table :users_questions_answers_sub_questions do |t|
      t.references :users_questions_answer, :null=>false
      t.references :sub_question, :null=>false
      t.integer :users_questions_answers_sub_questions_sub_answers_count, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end

    add_foreign_key :users_questions_answers_sub_questions, :users_questions_answers, on_delete: :cascade, on_update: :cascade
    add_foreign_key :users_questions_answers_sub_questions, :sub_questions, on_delete: :cascade, on_update: :cascade
    add_index :users_questions_answers_sub_questions, [:users_questions_answer_id, :sub_question_id], :unique=>true, :name=>'users_sub_q_unique'
  end
end
