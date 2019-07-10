class Waiting::Admin::MealsController < Waiting::Admin::BaseController
  before_action :set_dinner, only: [:show, :edit, :update, :destroy]

  def index
    default_params = params.permit(:office_id, :provider_id)
    @dinners = Dinner.includes(:office, :provider).default_where(default_params).page(params[:page])
  end

  def today
    q_params = {
      'orders.created_at-gte': Date.today.at_beginning_of_day,
      'orders.created_at-lte': Date.today.end_of_day
    }.with_indifferent_access
    @query_params = params.fetch(:q, {}).permit!
    @query_params.merge! params.permit(:office_id, :provider_id)
    q_params.merge! @query_params
    @dinners = Dinner.default_where(q_params).page(params[:page])
  end

  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new(dinner_params)

    if @dinner.save
      redirect_to hr_dinners_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @dinner.update(dinner_params)
      redirect_to hr_dinners_url
    else
      render :edit
    end
  end

  def destroy
    @dinner.destroy
    redirect_to hr_dinners_url
  end

  private
  def set_dinner
    @dinner = Dinner.find(params[:id])
  end

  def dinner_params
    params.fetch(:dinner, {}).permit(
      :name,
      :office_id,
      :provider_id,
      :position
    )
  end

end
