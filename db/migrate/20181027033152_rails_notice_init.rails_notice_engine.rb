# This migration comes from rails_notice_engine (originally 20170110025557)
class RailsNoticeInit < ActiveRecord::Migration[5.0]
  def change

    create_table :notifications do |t|
      t.references :receiver, polymorphic: true
      t.references :notifiable, polymorphic: true
      t.string :code
      t.integer :state, default: 0
      t.string :title
      t.string :body, limit: 5000
      t.string :link
      t.datetime :sending_at
      t.datetime :sent_at
      t.string :sent_result
      t.datetime :read_at, index: true
      t.boolean :verbose, default: false
      t.string :cc_emails
      t.timestamps
    end

    create_table :notification_settings do |t|
      t.references :receiver, polymorphic: true
      t.string :notifiable_types
      t.integer :showtime
      t.boolean :accept_email, default: true
      t.timestamps
    end

    create_table :notify_settings do |t|
      t.string :notifiable_type
      t.string :code
      t.string :notify_mailer
      t.string :notify_method
      t.string :only_verbose_columns
      t.string :except_verbose_columns
      t.string :cc_emails
      t.timestamps
    end

  end
end
