class Admin::VolunteersController < Admin::BaseController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @volunteers = Volunteer.page(params[:page])
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)

    unless @volunteer.save
      render :new, locals: { model: @volunteer }, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @volunteer.assign_attributes(volunteer_params)

    unless @volunteer.save
      render :edit, locals: { model: @volunteer }, status: :unprocessable_entity
    end
  end

  def destroy
    @volunteer.destroy
  end

  private
  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params
    params.fetch(:volunteer, {}).permit(
      :name,
      :mobile,
      :place
    )
  end

end
