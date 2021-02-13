class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def get_orders
    current_user
    if @current_user.role == "User"
      @pending_orders = Order.pending_orders_for(@current_user)
      @delivered_orders = Order.delivered_orders_for(@current_user)
      @page = "My orders"
    else
      @pending_orders = Order.pending_orders
      @delivered_orders = Order.delivered_orders
      @page = "All orders"
    end
  end

  def delivered
    id = params[:id]
    order = Order.find(id)
    order.delivered = true
    order.delivered_on = Time.now.in_time_zone("New Delhi")
    order.save()
    redirect_to orders_path
  end

  def index
    get_orders
    render "index"
  end

  def create
    current_user
    user_id = @current_user.id
    order = Order.new(
      date: Time.now,
      user_id: user_id,
      delivered: false,
      total_amount: 0
    )

    if order.save
      session[:order_id] = order.id
      redirect_to create_all_orders_path
    else
      flash[:error] = "some error occurred while creating order"
      redirect_to menus_path
    end
  end

  def confirm
    @page = "Confirm order"
    render "confirm"
  end

  def destroy
    @order = Order.find(session[:order_id])
    @orderitems = @order.order_items
    @orderitems.destroy_all
    @order.destroy

    session[:order_id] = nil
    current_order = nil
    redirect_to menus_path
  end
end