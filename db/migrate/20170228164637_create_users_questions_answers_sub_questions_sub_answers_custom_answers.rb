class CreateUsersQuestionsAnswersSubQuestionsSubAnswersCustomAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :users_questions_answers_sub_questions_sub_answers_custom_answers do |t|
      t.references :users_questions_answers_sub_questions_sub_answer, :null=>false, :null=>false
      t.string :title, :null=>false, :limit=>255
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    add_foreign_key :users_questions_answers_sub_questions_sub_answers_custom_answers, :users_questions_answers_sub_questions_sub_answers, on_delete: :cascade, on_update: :cascade
#    add_index :answers, [:question_id,:title], :unique=>true, :name=>:answers_unique
  end
end
