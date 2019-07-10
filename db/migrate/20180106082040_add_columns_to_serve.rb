class AddColumnsToServe < ActiveRecord::Migration[5.2]
  def change
    add_reference :serves, :deal, polymorphic: true
    add_column :serves, :contain_max, :boolean, default: false
    add_column :serves, :extra, :string
  end
end
