class Organ < ApplicationRecord
  include RailsCom::Taxon
  include RailsOrg::Organ
  include RailsWechat::Organ
  include RailsFactory::Organ
  include RailsRole::User
end
