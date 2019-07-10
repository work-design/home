class AddDescribeTypeToContents < ActiveRecord::Migration[5.1]
  def change
    add_reference :contents, :describe, polymorphic: true
  end
end
