class CheckoutsController < ApplicationController
  def index
    @page = "Checkout"
    if params.has_key?(:order_id)
      @permit_edit = false
      @order_id = params[:order_id]
      @orderitems = OrderItem.where(order_id: @order_id)
      @current_order = Order.find(@order_id)
      @current_user = User.find(@current_order.user_id)
    else
      @permit_edit = true
      current_user
      @orderitems = OrderItem.where(order_id: session[:order_id])
      if current_order
        @order_id = @current_order.id
      else
        @order_id = nil
      end
    end

    render "index"
  end
end