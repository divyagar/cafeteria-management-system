class CheckoutsController < ApplicationController
  def index
    current_user
    @orderitems = OrderItem.where(order_id: session[:order_id])
    if current_order
      @order_id = @current_order.id
    else
      @order_id = nil
    end

    render "index"
  end
end