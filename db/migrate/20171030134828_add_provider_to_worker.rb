class AddProviderToWorker < ActiveRecord::Migration[5.2]

  def change
    add_reference :workers, :provider
    add_reference :tasks, :user
  end

end
