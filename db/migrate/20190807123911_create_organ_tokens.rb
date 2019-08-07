class CreateOrganTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :organ_tokens do |t|
      t.references :organ
      t.references :user
      t.string :token
      t.datetime :expire_at
      t.timestamps
    end

    create_table :job_title_references do |t|
      t.references :super_job_title
      t.references :department_root
      t.references :department
      t.integer :grade
      t.timestamps
    end
    
    remove_column :job_titles, :super_job_title_id
  end
end
