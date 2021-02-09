class CreateUsersFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :users_families do |t|
      t.references :user, :null=>false
      t.references :family, :null=>false
      t.timestamps
    end
    add_index :users_families, [:user_id, :family_id], :unique=>true
  end
end
