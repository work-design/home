class ApplicationController < ActionController::Base
  include RailsAuth::Application
  include RailsCom::Application
  include RailsRole::Application
  include RailsOrg::Application
  include RailsTrade::MyCart
  protect_from_forgery with: :exception, unless: -> { json_format? }

  content_security_policy false

  default_form_builder 'ApplicationFormBuilder' do |config|

  end

  define_form_builder 'WechatFormBuilder' do |config|
    config.merge! SETTING['weui_form']
  end

end
