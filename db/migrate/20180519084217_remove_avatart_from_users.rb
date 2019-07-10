class RemoveAvatartFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatar
  end
end
