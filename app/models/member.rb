class Member < ApplicationRecord
  include RailsOrg::Member
  include RailsBench::Member
  include RailsRole::User
  include RailsTrade::Buyer
  include RailsFinance::Member
  include RailsAttend::Member
  include RailsNotice::Member
  include RailsNoticeExt::Setting

end
