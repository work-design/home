class AddShortNameToPromtoes < ActiveRecord::Migration[5.2]
  def change
    add_column :promotes, :short_name, :string
    add_column :promotes, :description, :string
  end
end
