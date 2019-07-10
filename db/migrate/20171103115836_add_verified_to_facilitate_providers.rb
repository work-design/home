class AddVerifiedToFacilitateProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :facilitate_providers, :verified, :boolean, default: false
  end
end
