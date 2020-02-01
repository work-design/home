class Admin::EscortsController < Admin::BaseController
  before_action :set_escort, only: [:show, :edit, :update, :destroy]

  def index
    q_params = {}
    q_params.merge! params.permit(:name, :state, 'accounts.identity')
    @escorts = Escort.default_where(q_params).order(id: :desc).page(params[:page])
  end

  def new
    @escort = Escort.new
  end

  def create
    @escort = Escort.new(escort_params)

    unless @escort.save
      render :new, locals: { model: @escort }, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @escort.assign_attributes(escort_params)

    unless @escort.save
      render :edit, locals: { model: @escort }, status: :unprocessable_entity
    end
  end

  def destroy
    @escort.destroy
  end

  private
  def set_escort
    @escort = Escort.find(params[:id])
  end

  def escort_params
    params.fetch(:escort, {}).permit(
      :from_name,
      :from_mobile,
      :from_address,
      :to_name,
      :to_mobile,
      :to_address,
      :goods,
      :car,
      :note,
      :state
    )
  end

end
