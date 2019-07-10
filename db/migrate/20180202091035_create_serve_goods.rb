class CreateServeGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :serve_goods do |t|
      t.references :good, polymorphic: true
      t.references :serve
      t.timestamps
    end

    rename_column :cart_items, :assistant, :myself
  end
end
