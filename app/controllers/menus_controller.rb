class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @orderitems = Orderitem.where(order_id: session[:order_id])
    puts "orderid : #{session[:order_id]} and #{@current_order}"
    if current_order
      @order_id = @current_order.id
    else
      @order_id = nil
    end
    render "index"
  end
end