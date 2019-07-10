class AddKindToPromoteGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :promote_goods, :kind, :string
  end
end
