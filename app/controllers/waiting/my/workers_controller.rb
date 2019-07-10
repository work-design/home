class Waiting::My::WorkersController < Waiting::My::BaseController
  before_action :set_user
  before_action :set_worker, only: [:show, :edit, :update, :present, :destroy]

  def index
    @workers = @user.workers
  end

  def new
    @worker = @user.workers.build
  end

  def create
    @worker = @user.workers.build(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to my_workers_url, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @my_worker }
      else
        format.html { render :new }
        format.json { render json: @my_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to my_workers_url, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_worker }
      else
        format.html { render :edit }
        format.json { render json: @my_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def present
    @worker.set_present
    redirect_back fallback_location: my_workers_url
  end

  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to my_workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = current_user
  end

  def set_worker
    @worker = Worker.find params[:id]
  end

  def worker_params
    params.fetch(:worker, {}).permit(:name, :duty_id, :provider_id, :pomodoro)
  end
end
