class AddCustomerToCustoms < ActiveRecord::Migration[5.2]
  def change
    remove_column :customs, :customer
    add_reference :customs, :customer, polymorphic: true
  end
end
