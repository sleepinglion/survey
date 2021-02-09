class CreateUsersQuestionsAnswersSubQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :users_questions_answers_sub_questions do |t|
      t.references :users_questions_answer, :null => false, index: { name: :uqas_users_questions_answer_id }
      t.references :sub_question, :null => false, index: { name: :uqas_sub_question_id }
      t.integer :users_questions_answers_sub_questions_sub_answers_count, :null => false, :default => 0
      t.boolean :enable, :null => false, :default => true
      t.timestamps
    end
    add_index :users_questions_answers_sub_questions, [:users_questions_answer_id, :sub_question_id], :unique => true, :name => 'users_sub_q_unique'
  end
end
