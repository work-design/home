class CreatePorductCustom < ActiveRecord::Migration[5.2]
  def change

    create_table :customs do |t|
      t.string :name
      t.string :customer
      t.string :state
      t.string :qr_code
      t.datetime :ordered_at
      t.timestamps
    end

    create_table :custom_parts do |t|
      t.references :custom
      t.references :part
      t.timestamps
    end

  end
end
