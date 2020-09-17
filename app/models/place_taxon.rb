class PlaceTaxon < ApplicationRecord
  include RailsTaxon::Node
  include RailsEvent::PlaceTaxon
  include RailsDetail::TaxonModel
end
