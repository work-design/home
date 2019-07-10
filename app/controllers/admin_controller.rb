class AdminController < ApplicationController
  include RailsRole::Controller
  before_action :require_login
  before_action :require_role

  default_form_builder 'AdminBuilder' do |config|

  end

  def current_manager
    current_user&.manager
  end

end
