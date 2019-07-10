class RemoveUserIdFromProviders < ActiveRecord::Migration[5.2]
  def change

    remove_column :providers, :user_id
  end
end
