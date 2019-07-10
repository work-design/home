class Facility::FacilitatesController < ApplicationController
  before_action :set_facilitate, only: [:show]

  def index
    @facilitate_taxons = FacilitateTaxon.all
    @facilitates = Facilitate.default_where(params.permit!).page(params[:page])
  end

  def show
  end

  def order

  end

  private
  def set_facilitate
    @facilitate = Facilitate.find(params[:id])
  end

  def facilitate_params
    params.fetch(:facilitate, {})
  end

end
