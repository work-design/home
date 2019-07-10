class AddPomodoroToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :pomodoro, :integer, default: 25
  end
end
