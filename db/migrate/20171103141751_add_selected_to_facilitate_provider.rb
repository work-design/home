class AddSelectedToFacilitateProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :facilitate_providers, :selected, :boolean
  end
end
