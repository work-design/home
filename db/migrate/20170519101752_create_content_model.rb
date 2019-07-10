class CreateContentModel < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.string :name
      t.integer :contents_count, default: 0
      t.integer :pictures_count, default: 0
      t.integer :links_count, default: 0
      t.timestamps null: false
    end

    create_table :contents, force: true do |t|
      t.string :type
      t.string :title
      t.string :key
      t.text :body, limit: 65535
      t.integer :position, limit: 4, default: 0
      t.string :list, limit: 50
      t.references :detail
      t.references :author
      t.timestamps null: false
    end
  end
end
