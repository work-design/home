class Profile < ApplicationRecord
  include RailsProfile::Profile
  include RailsProfile::Pupil
  include RailsProfile::Tutelar
  include RailsTrade::Buyer
  include RailsVip::Profile
  
  store :extra, accessors: [:wechat, :major, :degree, :highest_education, :work_experience], coder: ActiveRecord::PgCoder
end
