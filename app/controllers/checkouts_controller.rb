class CheckoutsController < ApplicationController
  def index
    current_user
    if params.has_key?(:order_id)
      @page = "Invoice"
      @permit_edit = false
      @order_id = params[:order_id]
      @orderitems = OrderItem.where(order_id: @order_id)
      @current_order = Order.find(@order_id)
      @user = User.find(@current_order.user_id)
    else
      @page = "Checkout"
      @permit_edit = true
      @user = @current_user
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