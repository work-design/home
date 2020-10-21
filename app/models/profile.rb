class Profile < ApplicationRecord
  include RailsProfile::Profile
  include RailsAgency::Client
  include RailsTrade::Buyer
  include RailsVip::Profile

  store_accessor :extra, :wechat, :major, :degree, :highest_education, :work_experience

end
