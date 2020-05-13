class DropTableEscorts < ActiveRecord::Migration[6.0]
  def change
    drop_table :escorts
  end
end
