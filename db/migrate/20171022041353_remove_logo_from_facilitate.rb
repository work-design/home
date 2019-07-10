class RemoveLogoFromFacilitate < ActiveRecord::Migration[5.2]
  def change
    remove_column :facilitates, :logo
  end
end
