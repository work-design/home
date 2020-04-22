class Place < ApplicationRecord
  include RailsEvent::Place
  include RailsDetail::TaxonModel
end
