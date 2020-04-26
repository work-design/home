class PlaceTaxon < ApplicationRecord
  prepend RailsTaxon::Node
  include RailsEvent::PlaceTaxon
  include RailsDetail::TaxonModel
end
