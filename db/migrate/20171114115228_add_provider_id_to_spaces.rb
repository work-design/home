class AddProviderIdToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :spaces, :provider
  end
end
