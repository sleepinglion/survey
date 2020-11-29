class CreateQuestionDescriptions < ActiveRecord::Migration[4.2]
  def change
    create_table :question_descriptions do |t|
      t.references :question, :null=>false
      t.text :description, :null=>false, :limit=>255
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    add_foreign_key :question_descriptions, :questions, on_delete: :cascade, on_update: :cascade
  end
end
