class Waiting::Admin::ManagersController < Waiting::Admin::BaseController
  before_action :set_manager, only: [:show, :edit, :update, :edit_user, :update_user, :destroy]

  def index
    @managers = Manager.page(params[:page])
  end

  def search
    @managers = Manager.where(real_name: params[:q])

    results = []
    @managers.each do |manager|
      results << { real_name: manager.real_name, id: manager.id }
    end
    render json: { results: results }
  end

  def new
    @manager = Manager.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @manager = Manager.new(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to admin_managers_url, notice: 'Employee was successfully created.' }
        format.js
      else
        format.html { redirect_to admin_managers_url, alert: @manager.errors }
        format.js
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @manager.assign_attributes(manager_params)
    respond_to do |format|
      if @manager.save
        format.html { redirect_to admin_managers_url, notice: 'Employee was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def edit_user

  end

  def update_user
    if params[:login].include?('@')
      user = User.find_by(email: params[:login])
    else
      user = User.find_by(mobile: params[:login])
    end

    respond_to do |format|
      if @manager.update(user_id: user&.id)
        format.html { redirect_to admin_managers_url, notice: 'Employee was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to admin_managers_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_manager
    @manager = Manager.find(params[:id])
  end

  def manager_params
    params.fetch(:manager, {}).permit(:title,
                                      :type,
                                      :real_name,
                                      :leader_id,
                                      :join_on,
                                      :disabled,
                                      :who_id
    )
  end

end
