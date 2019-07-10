class AddLogoToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :logo, :string
    remove_columns :workers, :leader_id, :type
  end
end
