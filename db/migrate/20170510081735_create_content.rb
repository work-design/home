class CreateContent < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.references :picture
      t.references :author
      t.string :title
      t.text :body
      t.timestamps
    end
    remove_columns :pictures, :desc, :title, :content_id
  end
end
