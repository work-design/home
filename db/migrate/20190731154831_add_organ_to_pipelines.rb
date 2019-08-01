class AddOrganToPipelines < ActiveRecord::Migration[6.0]
  def change
    add_reference :pipelines, :organ
  end
end
