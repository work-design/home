class Place < ApplicationRecord
  include RailsEvent::Place
  include RailsDetail::ItemModel
end
