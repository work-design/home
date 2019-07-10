class Waiting::My::MyController < Waiting::My::BaseController

  def index
    @user = current_user

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

end
