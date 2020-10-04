class AdminController < ApplicationController
  before_action :require_login
  before_action :require_role
  #before_action :require_session_organ

end
