class AddExtraToPromotes < ActiveRecord::Migration[5.2]
  def change
    add_column :promotes, :extra, :string, array: true
    rename_column :promotes, :overall, :overall_goods
    add_column :promote_buyers, :kind, :string
  end
end
