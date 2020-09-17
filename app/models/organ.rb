class Organ < ApplicationRecord
  include RailsTaxon::Node
  include RailsOrg::Organ
  include RailsWechat::Organ
  include RailsFactory::Organ
  include RailsFacility::Organ
  include RailsRole::User
end
