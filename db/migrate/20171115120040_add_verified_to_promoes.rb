class AddVerifiedToPromoes < ActiveRecord::Migration[5.2]
  def change
    remove_columns :promotes, :code, :unit, :scope
    add_column :promotes, :verified, :boolean, default: false
    add_column :promotes, :discount, :boolean, default: true

    create_table :order_promotes do |t|
      t.references :order, null: false
      t.references :order_item
      t.references :promote
      t.references :charge
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end

    create_table :promote_buyers do |t|
      t.references :buyer
      t.references :promote
      t.timestamps
    end

    create_table :promote_goods do |t|
      t.references :good, polymorphic: true
      t.references :promote
      t.timestamps
    end
  end
end
