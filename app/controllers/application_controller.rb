class ApplicationController < ActionController::Base
  include RailsAuth::Controller
  include RailsCom::Controller
  include RailsOrg::Controller
  include RailsRole::Controller
  protect_from_forgery with: :exception
  content_security_policy false


  default_form_builder 'ApplicationFormBuilder' do |config|

  end

  define_form_builder 'WechatFormBuilder' do |config|
    config.merge! SETTING['weui_form']
  end

end
