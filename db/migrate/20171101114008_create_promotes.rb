class CreatePromotes < ActiveRecord::Migration[5.2]
  def change

    create_table :promotes do |t|
      t.string :type
      t.string :code
      t.string :unit
      t.string :name
      t.integer :scope, default: 0
      t.datetime :start_at
      t.datetime :finish_at
      t.timestamps
    end
  end
end
