class AddTypeToJobTitles < ActiveRecord::Migration[6.0]
  def change
    add_column :job_titles, :type, :string
    add_reference :job_titles, :super_job_title
    
    add_reference :departments, :superior
    add_column :departments, :superior_ancestors, :jsonb
    add_column :departments, :parent_ancestors, :jsonb
    remove_column :departments, :collective_email
  end
end
