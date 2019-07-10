class RemoveProjectIdFromPipeline < ActiveRecord::Migration[5.2]
  def change
    remove_columns :pipelines, :project_id, :facilitate_provider_id

    add_column :facilitates, :import_price, :decimal, precision: 10, scale: 2
    add_column :facilitates, :profit_price, :decimal, precision: 10, scale: 2

    add_column :facilitate_providers, :export_price, :decimal, precision: 10, scale: 2
  end
end
