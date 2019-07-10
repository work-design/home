class CreateProjectMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_members do |t|
      t.references :duty
      t.references :worker
      t.timestamps
    end
  end
end