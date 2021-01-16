class CreateQuestionCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :question_categories do |t|
      t.references :branch, :null => false
      t.string :title, :null=>false, :limit=>60
      t.integer :questions_count, :null=>false, :default=>0
      t.boolean :female_only, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
