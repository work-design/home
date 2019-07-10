class RemoveBuyerIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :buyer_id
  end
end
