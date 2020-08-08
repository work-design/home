class Member < ApplicationRecord
  include RailsOrg::Member
  include RailsCrm::Member
  include RailsBench::Member
  include RailsRole::User
  include RailsTrade::Buyer
  include RailsFinance::User
  include RailsAttend::Member

end
