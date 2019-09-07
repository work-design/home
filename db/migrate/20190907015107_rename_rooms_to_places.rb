class RenameRoomsToPlaces < ActiveRecord::Migration[6.0]
  def change
    rename_table :rooms, :places
    rename_column :places, :room_number, :name
    rename_column :places, :limit_number, :max_members
    remove_columns :places, :time_plans_count
  end
end
