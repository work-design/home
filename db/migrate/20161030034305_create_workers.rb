class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.references :user
      t.string :title
      t.string :name
      t.integer :grade
      t.date :join_on
      t.boolean :disabled, default: false
      t.timestamps
    end
  end
end