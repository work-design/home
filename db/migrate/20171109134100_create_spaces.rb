class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :desc
      t.string :sku
      t.decimal :price, precision: 10, scale: 2
      t.decimal :import_price, precision: 10, scale: 2
      t.decimal :profit_price, precision: 10, scale: 2
      t.references :area
      t.timestamps
    end
  end
end
