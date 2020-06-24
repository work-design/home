class DropJobTitleSuper < ActiveRecord::Migration[6.0]
  def change
    drop_table :job_title_references
    drop_table :member_supers
    add_reference :job_titles, :super_job_title
  end
end
