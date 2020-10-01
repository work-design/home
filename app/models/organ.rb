class Organ < ApplicationRecord
  include RailsTaxon::Node
  include RailsOrg::Organ
  include RailsWechat::Organ
  include RailsFactory::Organ
  include RailsRole::User
end
