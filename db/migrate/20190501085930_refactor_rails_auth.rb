class RefactorRailsAuth < ActiveRecord::Migration[6.0]
  def change
    remove_columns :users, :email_confirmed, :mobile_confirmed, :role_id
    add_column :users, :timezone, :string
    add_column :users, :locale, :string
    add_column :users, :source, :string

    create_table :accounts do |t|
      t.references :user
      t.string :type
      t.string :identity
      t.boolean :confirmed, default: false
      t.boolean :primary, default: false
      t.timestamps
    end
    
    add_reference :verify_tokens, :account
    rename_column :verify_tokens, :account, :identity
    
    add_column :oauth_users, :unionid, :string, index: true
    add_column :oauth_users, :app_id, :string
    remove_columns :oauth_users, :auth_code, :app_auth_code, :app_auth_token
  end
end
