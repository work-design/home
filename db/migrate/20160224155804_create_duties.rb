class CreateDuties < ActiveRecord::Migration[5.0]
  def change
    create_table :duties do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :project_duties do |t|
      t.references :project
      t.references :duty
      t.references :user
      t.timestamps
    end
  end
end
