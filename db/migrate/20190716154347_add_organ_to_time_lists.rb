class AddOrganToTimeLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :time_lists, :organ
  end
end
