# This migration comes from rails_log_engine (originally 20160905092345)
class CreateLogRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :log_records do |t|
      t.string :path
      t.string :controller
      t.string :action
      t.string :params
      t.string :headers, limit: 4096
      t.string :cookie, limit: 2048
      t.string :session, limit: 2048
      t.string :exception, limit: 10240
      t.string :exception_object
      t.text :exception_backtrace
      t.timestamps
    end
  end
end
