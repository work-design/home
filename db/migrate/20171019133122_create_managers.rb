class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.references :user
      t.references :who
      t.references :leader
      t.boolean :disabled, default: false
      t.string :type
      t.string :title
      t.date :join_on
      t.timestamps
    end
  end
end
