class Waiting::My::MealsController < Waiting::My::BaseController
  before_action :set_dinner, only: [:show, :order]

  def index
    default_params = {
      office_id: [current_member.office_id, nil]
    }
    q_params = params.fetch(:q, {}).permit!
    q_params.merge! default_params
    if Dinner.enabled?
      @dinners = Dinner.default_where(q_params).page(params[:page])
    else
      @dinners = Dinner.none.page
    end
  end

  def order
    @order = @dinner.generate_order(current_member)
  end

  def mine

  end

  def show
  end

  private
  def set_dinner
    @dinner = Dinner.find(params[:id])
  end


end
