class AddMeteringToPromotes < ActiveRecord::Migration[6.0]
  def change
    add_column :promotes, :metering, :string
    add_column :promotes, :editable, :boolean
    remove_column :promote_charges, :metering
    add_column :promote_charges, :filter_min, :decimal, precision: 10, scale: 2
    add_column :promote_charges, :filter_max, :decimal, precision: 10, scale: 2
    add_column :trade_promotes, :computed_amount, :decimal, precision: 10, scale: 2
    add_column :trade_promotes, :note, :string
    add_reference :promote_buyers, :promote_good
  end
end
