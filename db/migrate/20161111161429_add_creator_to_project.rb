class AddCreatorToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :creator
  end
end
