class User < ApplicationRecord
  include RailsBench::User
  include RailsRole::User
  include RailsAuth::User
  include RailsTrade::User
  include RailsNotice::User
  include RailsNoticeExt::Setting
  include RailsWechat::User
  include RailsOrg::User
  include RailsProfile::User
  include RailsAgency::User

  has_one :wechat_user


end

