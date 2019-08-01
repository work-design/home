class RemoveBuyerFromCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :customs, :organ
  end
end
