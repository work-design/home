class PlaceTaxon < ApplicationRecord
  include RailsCom::Taxon
  include RailsEvent::PlaceTaxon
  include RailsDetail::TaxonModel
end
