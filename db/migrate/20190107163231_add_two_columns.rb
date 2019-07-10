class AddTwoColumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_serves, :serve_charge
    add_reference :cart_promotes, :promote_charge
  end
end
