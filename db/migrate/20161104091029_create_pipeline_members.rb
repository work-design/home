class CreatePipelineMembers < ActiveRecord::Migration[5.0]
  def change
    rename_table :pipelines, :pipeline_members
    rename_column :pipeline_members, :team_id, :pipeline_id
    create_table :pipelines do |t|
      t.string :name
      t.string :description
      t.references :project
      t.timestamps
    end

    create_table :team_members do |t|
      t.references :team
      t.references :duty
      t.references :worker
      t.timestamps
    end
  end
end
