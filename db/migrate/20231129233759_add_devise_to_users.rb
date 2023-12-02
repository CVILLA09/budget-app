class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
    ## Database authenticatable
    add_column :users, :email, :string, null: false, default: ""
    add_column :users, :encrypted_password, :string, null: false, default: ""

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    ## Trackable
    # Uncomment the following lines if you need tracking for sign-in count, timestamps, and IP address.
    # add_column :users, :sign_in_count, :integer, default: 0, null: false
    # add_column :users, :current_sign_in_at, :datetime
    # add_column :users, :last_sign_in_at, :datetime
    # add_column :users, :current_sign_in_ip, :inet
    # add_column :users, :last_sign_in_ip, :inet

    ## Confirmable
    # Uncomment the following lines if you need email confirmation functionality.
    # add_column :users, :confirmation_token, :string
    # add_column :users, :confirmed_at, :datetime
    # add_column :users, :confirmation_sent_at, :datetime
    # add_column :users, :unconfirmed_email, :string

    ## Lockable
    # Uncomment the following lines if you need locking functionality.
    # add_column :users, :failed_attempts, :integer, default: 0, null: false
    # add_column :users, :unlock_token, :string
    # add_column :users, :locked_at, :datetime

    ## Add indices for better query performance
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token, unique: true
    # add_index :users, :unlock_token, unique: true
  end
end
