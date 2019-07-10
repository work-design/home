class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :task
      t.datetime :started_at
      t.datetime :stopped_at
      t.timestamps
    end
  end
end
