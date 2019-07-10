class Waiting::SpacesController < ApplicationController
  before_action :set_space, only: [:show]

  def index
    @space_taxons = SpaceTaxon.all
    @spaces = Space.default_where(params.permit!).page(params[:page])
  end

  def show
  end

  private
  def set_space
    @space = Facilitate.find(params[:id])
  end

  def space_params
    params.fetch(:space, {})
  end
end
