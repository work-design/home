class AddMembersCount < ActiveRecord::Migration[6.0]
  def change
    rename_column :departments, :members_count, :member_departments_count
    add_column :departments, :all_member_departments_count, :integer
  end
end
