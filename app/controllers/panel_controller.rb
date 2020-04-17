class PanelController < ApplicationController
  before_action :require_login
  after_action :set_flash, only: [:update, :create, :destroy]

end unless defined? PanelController
