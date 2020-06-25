class ApplicationController < ActionController::Base
  include RailsAuth::Application
  include RailsWechat::Application
  include RailsCom::Application
  include RailsRole::Application
  include RailsOrg::Application
  include RailsTrade::Application
  before_action :support_organ
  protect_from_forgery with: :exception, unless: -> { json_format? }
  content_security_policy true

end
