class CreateTaskHierarchies < ActiveRecord::Migration[4.2]
  def change
    create_table :task_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :task_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "task_anc_desc_idx"

    add_index :task_hierarchies, [:descendant_id],
      name: "task_desc_idx"
  end
end
