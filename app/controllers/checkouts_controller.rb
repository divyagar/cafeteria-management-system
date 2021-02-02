class CheckoutsController < ApplicationController
  def index
    current_user
    @orderitems = Orderitem.where(order_id: session[:order_id])
    @totalprice = 0
    if current_order
      @order_id = @current_order.id
    else
      @order_id = nil
    end
    
    render "index"
  end
end