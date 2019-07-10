class CreateFacilitate < ActiveRecord::Migration[5.1]
  def change
    create_table :facilitates do |t|
      t.string :name
      t.string :logo
      t.string :desc
      t.timestamps
    end
  end
end
