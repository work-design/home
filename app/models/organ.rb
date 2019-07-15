class Organ < ApplicationRecord
  include RailsOrg::Organ
  include RailsWechat::Organ
  prepend RailsTaxon::Node
end
