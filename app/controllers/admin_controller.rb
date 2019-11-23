class AdminController < ApplicationController
  before_action :require_login
  before_action :require_role

  def current_manager
    current_user&.manager
  end

end
