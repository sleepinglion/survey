class CreateUsersQuestionsAnswersSubQuestionsSubAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_questions_answers_sub_questions_sub_answers do |t|
      t.references :users_questions_answers_sub_question, :null => false, index: { name: :uqass_users_questions_answers_sub_question_id }
      t.references :sub_answer, :null => false, index: { name: :uqass_sub_answer_id }
      t.boolean :enable, :null => false, :default => true
      t.timestamps
    end
    add_index :users_questions_answers_sub_questions_sub_answers, [:users_questions_answers_sub_question_id, :sub_answer_id], :unique => true, :name => 'users_sub_qa_unique'
  end
end
