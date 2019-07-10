class RefactorBuyer < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :buyer_id
    add_reference :cart_items, :buyer, polymorphic: true
  end
end
