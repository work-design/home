class AddOverallBuyersToPromtotes < ActiveRecord::Migration[5.2]
  def change
    add_column :promotes, :overall_buyers, :boolean, default: false
    add_column :promotes, :code, :string
  end
end
