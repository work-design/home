class RailsComMigration61 < ActiveRecord::Migration[6.0]

  def change






















































































    create_table :absences do |t|
      t.references :member
      t.references :merged
      t.string :type
      t.string :state, default: "init"
      t.float :hours, default: 0
      t.string :kind
      t.datetime :start_at
      t.datetime :finish_at
      t.string :note, limit: 2048
      t.string :comment, limit: 2048
      t.boolean :redeeming
      t.string :redeeming_days, array: true
      t.boolean :processed
      t.boolean :divided
      t.timestamps
    end

    create_table :attendance_logs do |t|
      t.references :unsure_member
      t.references :member
      t.references :attendance
      t.string :source, default: "machine"
      t.string :state, default: "init"
      t.string :name
      t.datetime :record_at
      t.boolean :processed
      t.string :kind
      t.string :note
      t.string :record_at_str
      t.timestamps
    end

    create_table :attendance_settings do |t|
      t.references :member
      t.references :financial_month
      t.string :state, default: "init"
      t.string :on_time, default: "08:30"
      t.string :off_time
      t.string :note
      t.timestamps
    end

    create_table :absence_stats do |t|
      t.string :year
      t.float :annual_days
      t.float :annual_add
      t.float :left_annual_days
      t.float :vacation_days
      t.string :details, limit: 1024
      t.timestamps
    end

    create_table :attendances do |t|
      t.references :member
      t.references :interval_absence
      t.references :late_absence
      t.references :leave_absence
      t.integer :late_minutes
      t.integer :leave_minutes
      t.float :overtime_hours
      t.float :attend_hours
      t.float :interval_hours
      t.float :total_hours
      t.date :attend_on
      t.datetime :start_at
      t.datetime :finish_at
      t.datetime :interval_start_at
      t.datetime :interval_finish_at
      t.string :kind
      t.integer :absence_minutes
      t.boolean :absence_redeeming
      t.string :lost_logs, array: true
      t.boolean :workday, default: true
      t.boolean :processed
      t.timestamps
    end

    create_table :financial_months do |t|
      t.references :organ
      t.date :begin_date
      t.date :end_date
      t.string :working_days
      t.string :color, default: "#8fdf82"
      t.timestamps
    end

    create_table :extra_days do |t|
      t.references :organ
      t.date :the_day
      t.string :name
      t.string :kind, comment: "holiday, workday"
      t.string :scope
      t.timestamps
    end

    create_table :attendance_stats do |t|
      t.references :member
      t.references :financial_month
      t.string :costed_absence, limit: 1024
      t.string :redeeming_absence, limit: 1024
      t.string :free_absence, limit: 1024
      t.integer :allowance_days
      t.integer :late_days
      t.float :absence_redeeming_hours
      t.float :cost_absence_hours
      t.float :holiday_redeeming_hours
      t.boolean :processed
      t.timestamps
    end

    create_table :overtimes do |t|
      t.references :member
      t.datetime :start_at
      t.datetime :finish_at
      t.string :note, limit: 1024
      t.string :comment, limit: 1024
      t.float :hours
      t.string :state, default: "init"
      t.timestamps
    end






















































































































  end

end
