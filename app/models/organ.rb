class Organ < ApplicationRecord
  include RailsOrg::Organ
  include RailsWechat::Organ
  include RailsFactory::Organ
  include RailsFacility::Organ
  prepend RailsTaxon::Node
end
