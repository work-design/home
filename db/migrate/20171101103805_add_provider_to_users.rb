class AddProviderToUsers < ActiveRecord::Migration[5.2]

  def change
    add_reference :users, :provider
    add_reference :users, :buyer

    remove_columns :users, :auth_token_expired_at, :mobile_code, :mobile_code_expired_at

    add_column :users, :email_confirmed, :boolean
    rename_column :users, :mobile_confirm, :mobile_confirmed
  end

end
