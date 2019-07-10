class Waiting::My::LinksController < Waiting::My::BaseController
  before_action :set_task
  before_action :set_link, only: [:edit, :update, :destroy]

  def index
    @links = @task.links
  end

  def new
    @link = @task.links.build
  end

  def create
    @link = @task.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
        format.js
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = Task.find params[:task_id]
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.fetch(:link, {}).permit(:title, :url, :desc)
  end
end
