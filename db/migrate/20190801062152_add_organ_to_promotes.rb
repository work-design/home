class AddOrganToPromotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :promotes, :organ
  end
end
