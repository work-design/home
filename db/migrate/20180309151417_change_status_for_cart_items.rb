class ChangeStatusForCartItems < ActiveRecord::Migration[5.2]
  def change
    change_column :cart_items, :status, :string
  end
end
