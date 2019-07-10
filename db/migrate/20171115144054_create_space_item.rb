class CreateSpaceItem < ActiveRecord::Migration[5.2]
  def change
    create_table :space_items do |t|
      t.references :space
      t.references :list
      t.references :item
      t.timestamps
    end
  end
end
