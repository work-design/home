class Waiting::Admin::BaseController < AdminController

  def current_manager
    current_user&.manager
  end

end
