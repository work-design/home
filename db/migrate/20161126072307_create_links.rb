class CreateLinks < ActiveRecord::Migration[5.0]
  def change

    create_table :links do |t|
      t.string :title
      t.string :url
      t.references :content
      t.timestamps
    end

    create_table :pictures do |t|
      t.string :title
      t.string :key
      t.string :desc
      t.references :content
      t.timestamps
    end

  end
end
