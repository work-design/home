# This migration comes from rails_com_engine (originally 20181012025833)
class CreateActiveStorageBlobDefaults < ActiveRecord::Migration[5.2]
  def change
    create_table :active_storage_blob_defaults do |t|
      t.references :blob
      t.string :record_class
      t.string :name
      t.timestamps
    end
  end
end
