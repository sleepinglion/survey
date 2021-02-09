class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.references :family_category, :null=>false
      t.integer :member, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
