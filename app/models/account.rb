class Account < ApplicationRecord
  include RailsAuth::Account
  include RailsOrg::Account

end
