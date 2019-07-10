class AddSectionIdToRoleRules < ActiveRecord::Migration[5.2]
  def change
    add_reference :role_rules, :section
  end
end
