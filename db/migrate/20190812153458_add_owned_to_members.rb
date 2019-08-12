class AddOwnedToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :owned, :boolean
    remove_column :organs, :creator_id
  end
end
