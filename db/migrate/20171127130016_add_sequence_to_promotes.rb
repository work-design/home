class AddSequenceToPromotes < ActiveRecord::Migration[5.2]
  def change
    add_column :promotes, :sequence, :integer, default: 1
    remove_column :promotes, :discount

    add_column :promotes, :overall, :boolean, default: false
    add_column :promotes, :scope, :string

    rename_column :order_promotes, :charge_id, :promote_charge_id

    create_table :serves do |t|
      t.string :type
      t.string :unit
      t.string :name
      t.string :scope
      t.boolean :verified, default: false
      t.boolean :overall, default: true
      t.boolean :default, default: false
      t.timestamps
    end

    create_table :serve_charges do |t|
      t.references :serve
      t.decimal :min, precision: 10, scale: 2, default: 0
      t.decimal :max, precision: 10, scale: 2, default: 99999999.99
      t.decimal :price, precision: 10, scale: 2
      t.string :type
      t.timestamps
    end

    create_table :order_serves do |t|
      t.references :order, null: false
      t.references :order_item
      t.references :serve
      t.references :serve_charge
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
