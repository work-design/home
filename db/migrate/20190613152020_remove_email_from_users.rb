class RemoveEmailFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_columns :users, :email, :mobile, :provider_id
  end
end
