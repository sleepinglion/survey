class CreateUsersQuestionsAnswersSubQuestionsSubAnswersCustomAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_questions_answers_sub_questions_sub_answers_custom_answers do |t|
      t.references :users_questions_answers_sub_questions_sub_answer, :null => false, index: { name: :uqassa_users_questions_answers_sub_questions_sub_answer_id }
      t.string :title, :null => false, :limit => 255
      t.boolean :enable, :null => false, :default => false
      t.timestamps
    end
  end
end
