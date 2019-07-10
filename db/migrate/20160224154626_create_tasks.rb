class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :project
      t.string :name
      t.integer :parent_id
      t.integer :parents, array: true
      t.integer :children, array: true
      t.timestamps
    end
  end
end
