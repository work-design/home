class MyController < ApplicationController
  include RailsAuth::Wechat
  before_action :require_login

end
