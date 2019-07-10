class AddAssignType < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :assignable_type, :string
    add_column :tasks, :assignable_id, :integer
    add_index :tasks, [:assignable_type, :assignable_id], unique: true
  end
end
