class AdminController < ApplicationController
  before_action :require_login
  before_action :require_role

  def rails_role_user
    if current_member
      [current_member, defined?(current_organ) && current_organ]
    else
      [current_user, defined?(current_organ) && current_organ]
    end
  end

end
