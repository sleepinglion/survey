class CreateQuestionDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :question_descriptions do |t|
      t.references :question, :null=>false
      t.text :description, :null=>false, :limit=>255
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
