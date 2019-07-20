class AddSuperiorIdToMemberDepartments < ActiveRecord::Migration[6.0]
  def change
    add_column :member_departments, :department_ancestors, :jsonb
    add_column :member_departments, :department_ids, :integer, array: true
    add_reference :member_departments, :superior
  end
end
