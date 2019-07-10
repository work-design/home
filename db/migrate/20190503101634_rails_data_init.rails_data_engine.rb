# This migration comes from rails_data_engine (originally 20150618053929)
class RailsDataInit < ActiveRecord::Migration[5.0]

  def change

    create_table :data_lists do |t|
      t.string :title
      t.string :comment, limit: 4096
      t.string :type
      t.string :parameters, limit: 1024
      t.string :columns, limit: 1024
      t.string :data_table
      t.string :export_excel
      t.string :export_pdf
      t.timestamps
    end

    create_table :table_lists do |t|
      t.references :data_list
      t.string :headers, limit: 4096
      t.string :footers, limit: 4096
      t.integer :table_items_count, default: 0
      t.string :parameters, limit: 1024
      t.string :timestamp
      t.boolean :done
      t.boolean :published
      t.timestamps
    end

    create_table :table_items do |t|
      t.references :table_list
      t.string :fields, limit: 4096
      t.timestamps
    end

    create_table :record_lists do |t|
      t.references :data_list
      t.string :columns, limit: 4096
      t.string :parameters, limit: 1024
      t.boolean :done
      t.timestamps
    end

    create_table :record_items do |t|
      t.references :record_list
      t.string :fields, limit: 10240
      t.timestamps
    end

  end

end
