class CheckoutsController < ApplicationController
  def index
    current_user
    
    if params.has_key?(:order_id)
      @page = "Invoice"
      @permit_edit = false
      @order_id = params[:order_id]
      @current_order = Order.find(@order_id)
      @orderitems = @current_order.order_items
      @user = @current_order.user
    else
      @page = "Checkout"
      @permit_edit = true
      @user = @current_user
      current_order
      @order_id = @current_order.id
      @orderitems = @current_order.order_items
    end

    render "index"
  end
end