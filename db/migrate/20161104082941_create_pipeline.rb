class CreatePipeline < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :teaming_type
      t.integer :teaming_id
      t.string :description, limit: 1024
      t.timestamps
    end

    rename_table :project_teams, :pipelines
    add_reference :pipelines, :team

    remove_column :pipelines, :project_id
  end
end