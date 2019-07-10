class CreateProjectFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :project_funds do |t|
      t.references :project
      t.decimal :price, precision: 10, scale: 2
      t.boolean :visible, default: true
      t.timestamps
    end
  end
end
