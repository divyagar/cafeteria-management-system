class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def current_user
    @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

  def current_order
    @current_order if @current_order
    if session[:order_id]
      @current_order = Order.find(session[:order_id])
    else
      nil
    end
  end

  def getOrders
    current_user
    if @current_user.role == "User"
      @pending_orders = Order.where("user_id = ? and delivered = false", @current_user.id)
      @delivered_orders = Order.where("user_id = ? and delivered = true", @current_user.id)
    else
      @pending_orders = Order.where(delivered: false)
      @delivered_orders = Order.where(delivered: true)
    end
  end
end
