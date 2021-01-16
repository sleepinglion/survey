class CreateAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :answers do |t|
      t.references :question, :null=>false
      t.string :title, :null=>false, :limit=>255
      t.string :photo, :limit=>100
      t.integer :sub_questions_count, :null=>false, :default=>0
      t.boolean :has_custom, :null=>false, :default=>false
      t.boolean :default, :null=>false, :default=>false
      t.boolean :only, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    add_foreign_key :answers, :questions, on_delete: :cascade, on_update: :cascade
#    add_index :answers, [:question_id,:title], :unique=>true, :name=>:answers_unique
  end
end
