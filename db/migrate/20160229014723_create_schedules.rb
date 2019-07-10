class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :repeat_type, :string
    add_column :tasks, :repeat_days, :integer, array: true
  end
end
