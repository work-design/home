class AddAccountToOauths < ActiveRecord::Migration[6.0]
  def change
    add_reference :oauth_users, :account
  end
end
