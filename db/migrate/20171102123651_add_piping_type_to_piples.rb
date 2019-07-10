class AddPipingTypeToPiples < ActiveRecord::Migration[5.2]
  def change
    add_reference :pipelines, :piping, polymorphic: true
  end
end
