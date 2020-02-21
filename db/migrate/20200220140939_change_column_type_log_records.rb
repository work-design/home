class ChangeColumnTypeLogRecords < ActiveRecord::Migration[6.0]
  def change
    remove_columns :log_records, :headers, :params, :cookie, :session
    add_column :log_records, :headers, :jsonb
    add_column :log_records, :params, :jsonb
    add_column :log_records, :cookie, :jsonb
    add_column :log_records, :session, :jsonb
  end
end
