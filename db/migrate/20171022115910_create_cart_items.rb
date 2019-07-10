class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :buyer
      t.string :session_id, limit: 128, index: true
      t.references :good, polymorphic: true
      t.integer :quantity
      t.integer :status, default: 0
      t.timestamps
    end
  end
end