class AddProjectToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :project_members, :project
  end
end
