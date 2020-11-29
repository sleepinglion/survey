class CreateDeviseToAdmins < ActiveRecord::Migration[4.2]
    def change
        create_table :admins do |t|
            t.integer :parent_id

            ## Database authenticatable
            t.string :login_id, null: false, limit: 60
            t.string :email, limit: 100
            t.string :nickname, limit: 100
            t.string :encrypted_password, null: false, limit: 60
            t.string :photo, limit: 150

            t.boolean :enable, null: false, default: true

            ## Recoverable
            # t.string   :reset_password_token, :limit=>150
            # t.datetime :reset_password_sent_at

            ## Rememberable
            # t.datetime :remember_created_at

            ## Trackable
            t.integer  :sign_in_count, default: 0
            t.datetime :current_sign_in_at
            t.datetime :last_sign_in_at
            t.string   :current_sign_in_ip
            t.string   :last_sign_in_ip

            ## Confirmable
            # t.string   :confirmation_token
            # t.datetime :confirmed_at
            # t.datetime :confirmation_sent_at
            # t.string   :unconfirmed_email # Only if using reconfirmable

            ## Lockable
            # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
            # t.string   :unlock_token # Only if unlock strategy is :email or :both
            # t.datetime :locked_at

            ## Token authenticatable
            ## t.string :authentication_token

            # Uncomment below if timestamps were not included in your original model.
            t.timestamps
        end

        add_index :admins, :login_id,             unique: true
        add_index :admins, :email,                unique: true
        add_index :admins, :nickname,             unique: true
        # add_index :admins, :reset_password_token, :unique => true
        # add_index :admins, :confirmation_token,   :unique => true
        # add_index :admins, :unlock_token,         :unique => true
        # add_index :admins, :authentication_token, :unique => true
    end
end
