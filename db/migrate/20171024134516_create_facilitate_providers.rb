class CreateFacilitateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :facilitate_providers do |t|
      t.references :facilitate
      t.references :provider
      t.timestamps
    end
  end
end
