class AdminController < ApplicationController
  include RailsOrg::Application

  before_action :require_login
  before_action :require_role

  def rails_role_user
    if current_member
      current_member
    else
      current_user
    end
  end

end
