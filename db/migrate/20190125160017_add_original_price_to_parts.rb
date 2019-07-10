class AddOriginalPriceToParts < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_parts, :original_price, :decimal, precision: 10, scale: 2
    add_column :custom_parts, :price, :decimal, precision: 10, scale: 2
    add_column :customs, :price, :decimal, precision: 10, scale: 2
  end
end
