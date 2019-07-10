class RefactorMoreTrade < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :user_id
    remove_columns :orders, :user_id, :buyer_id
    add_reference :orders, :buyer, polymorphic: true

    remove_column :payment_references, :buyer_id
    add_reference :payment_references, :buyer, polymorphic: true

    remove_column :promote_buyers, :buyer_id
    add_reference :promote_buyers, :buyer, polymorphic: true
    add_column :promote_buyers, :state, :string


  end
end
