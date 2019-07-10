class RemoveUserIdFromBuyers < ActiveRecord::Migration[5.2]
  def change
    remove_columns :buyers, :user_id
  end
end
