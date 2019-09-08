class ChangeRepeatDaysToJsonb < ActiveRecord::Migration[6.0]
  def change
    remove_column :plans, :repeat_days
    add_column :plans, :repeat_days, :jsonb
  end
end
