class Organ < ApplicationRecord
  include RailsOrg::Organ
  include RailsWechat::Organ
  include RailsTaxon::Node
end
