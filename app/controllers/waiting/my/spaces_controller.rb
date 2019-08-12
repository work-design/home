class Waiting::My::SpacesController < Waiting::My::BaseController
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    @spaces = current_organ.spaces
  end

  def show
  end

  def new
    @space = current_organ.spaces.build(space_taxon_id: params[:space_taxon_id])
  end

  def edit
  end

  def create
    @space = current_organ.spaces.build(space_params)

    respond_to do |format|
      if @space.save
        format.html { redirect_to my_spaces_url, notice: 'Space was successfully created.' }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to my_spaces_url, notice: 'Space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_space
    @space = current_organ.spaces.find(params[:id])
  end

  def space_params
    params.fetch(:space, {}).permit(:area_id, :space_taxon_id, :name, :desc)
  end
end
