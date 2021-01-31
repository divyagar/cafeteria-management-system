class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @orderitems = Orderitem.where(order_id: session[:order_id])
    current_order
    render "index"
  end
end