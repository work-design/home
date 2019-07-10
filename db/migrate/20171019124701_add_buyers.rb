class AddBuyers < ActiveRecord::Migration[5.1]
  def change

    create_table :buyers do |t|
      t.string :name
      t.integer :state, default: 0
      t.integer :deposit_ratio, default: 100
      t.references :user
      t.references :payment_strategy
      t.timestamps
    end

  end
end
