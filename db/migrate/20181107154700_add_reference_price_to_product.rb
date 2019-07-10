class AddReferencePriceToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :customs, :name
    add_reference :customs, :product
    add_column :products, :reference_price, :decimal, precision: 10, scale: 2
  end
end
