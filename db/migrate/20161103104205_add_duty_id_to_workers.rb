class AddDutyIdToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_reference :workers, :duty
    rename_column :project_duties, :user_id, :worker_id
    rename_table :project_duties, :project_teams
    add_column :project_teams, :position, :integer, default: 1
  end
end
