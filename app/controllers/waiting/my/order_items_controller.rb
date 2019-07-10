class Waiting::My::OrderItemsController < Waiting::My::BaseController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def index
    @order_items = OrderItem.all
  end

  def show
    @facilitate_provider = FacilitateProvider.find_by(facilitate_id: @order_item.good_id, provider_id: @order_item.provider_id)
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end

  def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      redirect_to @order_item
    else
      render :new
    end
  end

  def update
    if @order_item.update(order_item_params)
      redirect_to @order_item
    else
      render :edit
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_items_url
  end

  private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.fetch(:order_item, {})
  end
end
