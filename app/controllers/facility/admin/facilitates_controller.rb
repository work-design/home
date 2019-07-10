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

    respond_to do |format|
      if @facilitate.save
        @facilitate.logo.attach(logo_params) if logo_params.present?
        format.html { redirect_to admin_facilitates_url, notice: 'Facilitate was successfully created.' }
        format.json { render :show, status: :created, location: @facilitate }
      else
        format.html { render :new }
        format.json { render json: @facilitate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @facilitate.logo.attach(logo_params) if logo_params.present?
    respond_to do |format|
      if @facilitate.update(facilitate_params)
        format.html { redirect_to admin_facilitates_url, notice: 'Facilitate was successfully updated.' }
        format.json { render :show, status: :ok, location: @facilitate }
      else
        format.html { render :edit }
        format.json { render json: @facilitate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @facilitate.destroy
    respond_to do |format|
      format.html { redirect_to admin_facilitates_url, notice: 'Facilitate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_facilitate
    @facilitate = Facilitate.find(params[:id])
  end

  def facilitate_params
    params.fetch(:facilitate, {}).permit(:name, :desc, :facilitate_taxon_id)
  end

  def logo_params
    params.fetch(:facilitate, {}).permit(:logo).fetch(:logo, {})
  end

end
