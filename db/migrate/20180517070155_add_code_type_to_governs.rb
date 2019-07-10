class AddCodeTypeToGoverns < ActiveRecord::Migration[5.2]
  def change
    add_column :govern_taxons, :code, :string
    add_column :governs, :type, :string
  end
end
