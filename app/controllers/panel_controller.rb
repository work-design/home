class PanelController < ApplicationController
  before_action :require_login
  before_action :require_role
  after_action :set_flash, only: [:update, :create, :destroy]

  def rails_role_user
    current_user
  end

end unless defined? PanelController
