class AddWhoToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_reference :workers, :who
  end
end
