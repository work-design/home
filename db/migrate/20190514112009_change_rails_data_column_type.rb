class ChangeRailsDataColumnType < ActiveRecord::Migration[6.0]
  def change
    remove_columns :data_lists, :parameters, :columns
    add_column :data_lists, :parameters, :jsonb
    add_column :data_lists, :columns, :jsonb
    
    remove_columns :table_lists, :headers, :footers, :parameters
    add_column :table_lists, :headers, :string, array: true
    add_column :table_lists, :footers, :string, array: true
    add_column :table_lists, :parameters, :jsonb
    
    remove_column :table_items, :fields
    add_column :table_items, :fields, :string, array: true
    
    remove_columns :record_lists, :parameters, :columns
    add_column :record_lists, :parameters, :jsonb
    add_column :record_lists, :columns, :jsonb
    
    remove_columns :record_items, :fields
    add_column :record_items, :fields, :jsonb
  end
end
