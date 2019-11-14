class AddArchiveToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :archived, :boolean
    remove_columns :notifications, :sent_at, :sent_result, :cc_emails
    create_table :notification_sendings do |t|
      t.string :way
      t.string :sent_to
      t.datetime :sent_at
      t.string :sent_result
      t.timestamps
    end
  end
end
