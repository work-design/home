class MyController < ApplicationController
  before_action :require_login
  #before_action :require_session_organ

end
