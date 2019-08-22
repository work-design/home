class AddNameToPipelineMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :pipeline_members, :name, :string
  end
end
