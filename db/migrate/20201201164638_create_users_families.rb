class CreateUsersFamilies < ActiveRecord::Migration[4.2]
  def change
    create_table :users_families do |t|
      t.references :user, :null=>false
      t.references :family, :null=>false
      t.timestamps
    end

    add_foreign_key :users_families, :users, on_delete: :cascade, on_update: :cascade
    add_foreign_key :users_families, :families, on_delete: :cascade, on_update: :cascade
    add_index :users_families, [:user_id, :family_id], :unique=>true
  end
end
