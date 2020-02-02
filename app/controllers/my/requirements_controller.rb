class My::RequirementsController < My::BaseController
  before_action :set_requirement, only: [:show, :edit, :update, :pickup, :done, :destroy]

  def list
    if current_user.plate_number.blank?
      redirect_to edit_my_user_url(return_to: list_my_requirements_url)
    end

    q_params = {
      state: 'init',
      'pick_on-gte': Date.today.to_s
    }
    q_params.merge! params.permit('pick_on-gte', 'from_area.parent_id')
    @requirements = Requirement.default_where(q_params).order(id: :desc).page(params[:page])
  end

  def picked
    @requirements = current_user.picked_requirements.order(id: :desc).page(params[:page])
  end

  def index
    @requirements = current_user.requirements.order(id: :desc).page(params[:page])
  end

  def new
    @requirement = current_user.requirements.build
  end

  def create
    @requirement = current_user.requirements.build(requirement_params)

    if @requirement.save
      render 'create', locals: { return_to: my_requirements_url }
    else
      render :new, locals: { model: @requirement }, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @requirement.assign_attributes(requirement_params)

    if @requirement.save
      render 'create', locals: { return_to: my_requirements_url }
    else
      render :edit, locals: { model: @requirement }, status: :unprocessable_entity
    end
  end

  def pickup
    @requirement.volunteer_id = current_user.id
    @requirement.state = 'picked'

    if @requirement.save
      render 'pickup'
    end
  end

  def done
    @requirement.state = 'done'

    if @requirement.save
      render 'pickup'
    end
  end

  def destroy
    @requirement.destroy
  end

  private
  def set_requirement
    @requirement = Requirement.find(params[:id])
  end

  def requirement_params
    params.fetch(:requirement, {}).permit(
      :name,
      :from_area_id,
      :from,
      :to_area_id,
      :to,
      :pick_on,
      :pick_at,
      :note,
      :credential
    )
  end

end
