class AddOfficalToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :annunciations, :notifications_count, :integer
    add_column :annunciations, :readed_count, :integer
    add_column :notifications, :official, :boolean
  end
end
