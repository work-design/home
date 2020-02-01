class My::EscortsController < My::BaseController
  before_action :set_escort, only: [:show, :edit, :update, :pickup, :done, :destroy]

  def list
    if current_user.plate_number.blank?
      redirect_to edit_my_user_url(return_to: list_my_escorts_url)
    end

    q_params = {
      state: 'init',
      'pick_on-gte': Date.today.to_s
    }
    q_params.merge! params.permit('pick_on-gte')
    @escorts = Escort.default_where(q_params).order(id: :desc).page(params[:page])
  end

  def picked
    @escorts = current_user.picked_escorts.order(id: :desc).page(params[:page])
  end

  def index
    @escorts = current_user.escorts.order(id: :desc).page(params[:page])
  end

  def new
    @escort = current_user.escorts.build
  end

  def create
    @escort = current_user.escorts.build(escort_params)

    if @escort.save
      render 'create', locals: { return_to: my_escorts_url }
    else
      render :new, locals: { model: @escort }, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @escort.assign_attributes(escort_params)

    if @escort.save
      render 'create', locals: { return_to: my_escorts_url }
    else
      render :edit, locals: { model: @escort }, status: :unprocessable_entity
    end
  end

  def pickup
    @escort.volunteer_id = current_user.id
    @escort.state = 'picked'

    if @escort.save
      render 'pickup'
    end
  end

  def done
    @escort.state = 'done'

    if @escort.save
      render 'pickup'
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
