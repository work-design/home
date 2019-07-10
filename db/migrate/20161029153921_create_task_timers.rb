class CreateTaskTimers < ActiveRecord::Migration[5.0]
  def change
    create_table :task_timers do |t|
      t.references :task
      t.integer :duration
      t.datetime :finish_at
      t.timestamps
    end

    create_table :task_workers do |t|
      t.references :task
      t.references :worker
      t.integer :position
      t.boolean :current, default: false
      t.timestamps
    end
  end
end
