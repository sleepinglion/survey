class CreateFamilies < ActiveRecord::Migration[4.2]
  def change
    create_table :families do |t|
      t.references :family_category, :null=>false
      t.integer :member, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    add_foreign_key :families, :family_categories, on_delete: :cascade, on_update: :cascade
  end
end
