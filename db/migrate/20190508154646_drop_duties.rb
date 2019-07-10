class DropDuties < ActiveRecord::Migration[6.0]
  def change
    drop_table :duties
  end
end
