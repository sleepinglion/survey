class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :title,:null=>false
      t.integer :branches_count, :null=>false, :default=>0
      t.integer :premium, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end
