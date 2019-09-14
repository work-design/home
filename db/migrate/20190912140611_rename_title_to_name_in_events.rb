class RenameTitleToNameInEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :title, :name
    rename_column :event_items, :title, :name
    add_reference :plan_items, :time_list_id
  end
end
