class PanelController < ApplicationController
  before_action :require_login
  before_action :require_role
  after_action :set_flash, only: [:update, :create, :destroy]

end unless defined? PanelController
