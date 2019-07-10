class Waiting::Admin::SpaceTaxonsController < Waiting::Admin::BaseController
  before_action :set_space_taxon, only: [:show, :edit, :update, :destroy]

  def index
    @space_taxons = SpaceTaxon.page(params[:page])
  end

  def show
  end

  def new
    @space_taxon = SpaceTaxon.new
  end

  def edit
  end

  def create
    @space_taxon = SpaceTaxon.new(space_taxon_params)

    respond_to do |format|
      if @space_taxon.save
        format.html { redirect_to admin_space_taxons_url, notice: 'Space taxon was successfully created.' }
        format.json { render :show, status: :created, location: @space_taxon }
      else
        format.html { render :new }
        format.json { render json: @space_taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @space_taxon.update(space_taxon_params)
        format.html { redirect_to admin_space_taxons_url, notice: 'Space taxon was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_taxon }
      else
        format.html { render :edit }
        format.json { render json: @space_taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @space_taxon.destroy
    respond_to do |format|
      format.html { redirect_to admin_space_taxons_url, notice: 'Space taxon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_space_taxon
    @space_taxon = SpaceTaxon.find(params[:id])
  end

  def space_taxon_params
    params.fetch(:space_taxon, {}).permit(:name)
  end

end
