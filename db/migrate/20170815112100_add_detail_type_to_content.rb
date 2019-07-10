class AddDetailTypeToContent < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :detail_type, :string
  end
end
