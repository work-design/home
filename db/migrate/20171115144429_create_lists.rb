class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :position, defalut: 1
      t.integer :items_count, default: 0
      t.integer :status, default: 0
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.string :logo
      t.string :type
      t.string :key
      t.string :desc, limit: 1024
      t.timestamps
    end

    add_column :space_items, :value, :string
    add_column :areas, :district, :string
  end
end


