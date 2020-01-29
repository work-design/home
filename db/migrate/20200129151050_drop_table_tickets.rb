class DropTableTickets < ActiveRecord::Migration[6.0]
  def change
    drop_table :tickets
    drop_table :ticket_items
  end
end
