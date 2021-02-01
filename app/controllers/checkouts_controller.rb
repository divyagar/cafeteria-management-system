class CheckoutsController < ApplicationController
  def index
    current_user
    @orderitems = Orderitem.where(order_id: session[:order_id])
    @totalprice = 0
    render "index"
  end
end