class AddOrganToEventTaxons < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_taxons, :organ
    add_reference :events, :organ
  end
end
