class RemovePresentFromWorkers < ActiveRecord::Migration[6.0]
  def change
    remove_columns :workers, :present
  end
end
