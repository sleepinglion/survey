class CreateUsersQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :users_questions do |t|
      t.references :user, :null=>false
      t.references :question, :null=>false
      t.integer :users_questions_answers_count, :null=>false, :default=>0
      t.timestamps
    end
    add_index :users_questions, [:user_id, :question_id], :unique=>true
  end
end
