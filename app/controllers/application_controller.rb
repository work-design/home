class ApplicationController < ActionController::Base
  include RailsAuth::Application
  include RailsWechat::Application
  include RailsCom::Application
  include RailsRole::Application
  include RailsTrade::MyCart
  include RailsOrg::Application
  protect_from_forgery with: :exception, unless: -> { json_format? }
  content_security_policy true

end
