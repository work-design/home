class MyController < ApplicationController
  include RailsAuth::Wechat
  include RailsOrg::OrgController
  before_action :require_login
  
end
