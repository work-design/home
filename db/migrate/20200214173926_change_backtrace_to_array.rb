class ChangeBacktraceToArray < ActiveRecord::Migration[6.0]
  def change
    remove_column :log_records, :exception_backtrace
    add_column :log_records, :exception_backtrace, :string, array: true
  end
end
