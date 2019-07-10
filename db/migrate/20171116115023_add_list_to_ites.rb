class AddListToItes < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :list
  end
end
