class RailsComMigration48 < ActiveRecord::Migration[6.0]

  def change

















































































































    add_column :seats, :min_members, :integer, default: 1
    add_column :seats, :max_members, :integer






















    create_table :wait_taxons do |t|
      t.references :organ
      t.string :name
      t.timestamps
    end

    create_table :wait_lists do |t|
      t.references :address
      t.references :wait_taxon
      t.references :organ
      t.string :state
      t.datetime :start_at
      t.datetime :finish_at
      t.integer :wait_items_count, default: 0
      t.timestamps
    end

    create_table :wait_items do |t|
      t.references :order
      t.references :user
      t.references :wait_list
      t.string :state
      t.integer :position
      t.timestamps
    end

































































  end

end
