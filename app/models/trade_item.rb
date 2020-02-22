class TradeItem < ApplicationRecord
  include RailsTrade::TradeItem
  include RailsVip::TradeItem
  include RailsShip::TradeItem
end




