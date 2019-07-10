class AddOrganToJobTitles < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_titles, :organ
    add_column :job_titles, :description, :string
    add_column :job_titles, :cached_role_ids, :integer, array: true
  end
end
