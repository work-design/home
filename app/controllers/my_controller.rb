class MyController < ApplicationController
  include RailsAuth::Application
  before_action :require_login
  
end
