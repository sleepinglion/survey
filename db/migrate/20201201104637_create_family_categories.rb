class CreateFamilyCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :family_categories do |t|
      t.string :title, :null=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
