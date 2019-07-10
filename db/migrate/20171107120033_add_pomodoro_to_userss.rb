class AddPomodoroToUserss < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pomodoro, :integer, default: 25
  end
end
