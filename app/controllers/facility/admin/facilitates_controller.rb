class Facility::Admin::FacilitatesController < Facility::Admin::BaseController
  before_action :set_facilitate, only: [:show, :edit, :update, :destroy]

  def index
    @facilitates = Facilitate.page(params[:page])
  end

  def show
  end

  def new
    @facilitate = Facilitate.new
    @options = FacilitateTaxon.select(:id, :name).all
  end

  def edit
    @options = FacilitateTaxon.select(:id, :name).all
  end

  def create
    @facilitate = Facilitate.new(facilitate_params)

    unless @facilitate.save
      render :new, locals: { model: @facilitate }, status: :unprocessable_entity
    end
  end

  def update
    @facilitate.assign_attributes facilitate_params

    unless @facilitate.save
      render :edit, locals: { model: @facilitate }, status: :unprocessable_entity
    end
  end

  def destroy
    @facilitate.destroy
  end

  private
  def set_facilitate
    @facilitate = Facilitate.find(params[:id])
  end

  def facilitate_params
    params.fetch(:facilitate, {}).permit(
      :name,
      :description,
      :price,
      :logo,
      :facilitate_taxon_id
    )
  end

end
