class AddCartIdToCustoms < ActiveRecord::Migration[6.0]
  def change
    add_reference :customs, :cart
  end
end
