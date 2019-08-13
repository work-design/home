class AddOrganToCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :organ
  end
end
