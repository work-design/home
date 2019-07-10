class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :code
      t.timestamps
    end

    remove_column :contents, :key
  end
end
