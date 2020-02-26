class Member < ApplicationRecord
  include RailsOrg::Member
  include RailsCrm::Member
  include RailsBench::Member
  include RailsRole::User
  include RailsTrade::Buyer
  include RailsTrade::User
  include RailsNotice::Receiver
  include RailsFinance::User
end
