class My::RequirementsController < My::BaseController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  def list
    q_params = {
      requirement_volunteers_count: 0,
      'pick_on-gte': Date.today.to_s
    }
    @requirements = Requirement.default_where(q_params).order(id: :desc).page(params[:page])
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
    @rv = current_user.requirement_volunteers.find_or_initialize_by(requirement_id: params[:id])

    if @rv.save
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
      :from,
      :to,
      :pick_on,
      :pick_at,
      :note,
      :credential
    )
  end

end
