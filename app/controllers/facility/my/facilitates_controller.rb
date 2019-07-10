class Facility::My::FacilitatesController < Facility::My::BaseController
  before_action :set_facilitate, only: [:show, :order]


  def index
    @facilitate_taxons = FacilitateTaxon.all
    @facilitates = Facilitate.default_where(params.permit!).page(params[:page])
  end

  def show
  end
  
  def order
    @facilitate.generate_order(current_user)
    redirect_to my_orders_url
  end

  private
  
  def set_facilitate
    @facilitate = Facilitate.find(params[:id])
  end

  def facilitate_params
    params.fetch(:facilitate, {})
  end
end
