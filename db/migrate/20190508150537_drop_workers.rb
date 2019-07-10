class DropWorkers < ActiveRecord::Migration[6.0]
  def change
    drop_table :workers
    add_column :members, :pomodoro, :integer
    
    rename_column :tasks, :worker_id, :member_id
    rename_column :team_members, :worker_id, :member_id
    rename_column :pipeline_members, :worker_id, :member_id
    rename_column :project_members, :worker_id, :member_id
    
    rename_column :pipeline_members, :duty_id, :job_title_id
    rename_column :project_members, :duty_id, :job_title_id
    rename_column :team_members, :duty_id, :job_title_id
  end
end
