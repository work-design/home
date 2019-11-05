class AddSuperJobTitles < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_titles, :limit_number, :limit_member
    remove_columns :job_titles, :type, :organ_id
    remove_columns :member_departments, :department_ids, :major
    
    create_table :super_job_titles do |t|
      t.references :organ
      t.string :name
      t.string :description
      t.integer :grade
      t.integer :limit_member
      if connection.adapter_name == 'PostgreSQL'
        t.integer :cached_role_ids, array: true
      else
        t.string :cached_role_ids
      end
      t.timestamps
    end
    
  end
end
