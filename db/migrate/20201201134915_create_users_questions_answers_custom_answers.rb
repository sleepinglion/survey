class CreateUsersQuestionsAnswersCustomAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_questions_answers_custom_answers do |t|
      t.references :users_questions_answer, :null=>false, index: {unique:true, name: :uqaca_users_questions_answer_id }
      t.string :title, :null=>false, :limit=>255
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
      end
  end
end
