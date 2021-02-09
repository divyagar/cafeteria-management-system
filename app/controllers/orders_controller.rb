class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def delivered
    id = params[:id]
    order = Order.find(id)
    order.delivered = true
    order.delivered_on = Time.now.in_time_zone("New Delhi")
    order.save()
    getOrders
    render "index"
  end

  def index
    getOrders
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
      redirect_to menus_path
    else
      flash[:error] = "some error occurred while creating order"
      redirect_to menus_path
    end
  end

  def confirm
    render "confirm"
  end

  def destroy
    Order.find(session[:order_id]).destroy
    session[:order_id] = nil
    current_order = nil
    redirect_to menus_path
  end
end