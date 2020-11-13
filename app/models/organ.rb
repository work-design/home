class Organ < ApplicationRecord
  include RailsCom::Taxon
  include RailsOrg::Organ
  include RailsWechat::Organ
  include RailsBench::Organ
  include RailsRole::User
end
