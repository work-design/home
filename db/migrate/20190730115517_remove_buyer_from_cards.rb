class RemoveBuyerFromCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :customs, :organ
    remove_columns :cards, :buyer_type, :buyer_id
  end
end
