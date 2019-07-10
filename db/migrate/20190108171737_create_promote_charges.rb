class CreatePromoteCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :promote_charges do |t|
      t.references :promote
      t.decimal :min, precision: 10, scale: 2, default: 0
      t.decimal :max, precision: 10, scale: 2, default: 99999999.99
      t.decimal :parameter, precision: 10, scale: 2
      t.string :type
      t.timestamps
    end
  end
end
