class Facility::FacilitatesController < ApplicationController
  before_action :set_facilitate, only: [:show]

  def index
    q_params = {}
    q_params.merge! default_params
    @facilitate_taxons = FacilitateTaxon.default_where(q_params)
    @facilitates = Facilitate.default_where(q_params).page(params[:page])
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
