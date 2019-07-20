class RemoveDepartmentIdFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_columns :members, :grade, :job_title_id, :department_id, :office_id
  end
end
