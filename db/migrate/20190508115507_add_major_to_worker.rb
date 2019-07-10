class AddMajorToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :major, :boolean, default: true
  end
end
