class ChangeOrderStateType < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :state, :string
    change_column :tasks, :state, :string
    change_column :tasks, :focus, :string
    change_column :notifications, :state, :string
  end
end
