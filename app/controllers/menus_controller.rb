class MenusController < ApplicationController
  def index
    @page = "Menu"
    @menus = Menu.all
    @orderitems = OrderItem.where(order_id: session[:order_id])
    puts "orderid : #{session[:order_id]} and #{@current_order}"
    if current_order
      @order_id = @current_order.id
    else
      @order_id = nil
    end

    @options = []
    menus = Menu.all
    menus.each do |menu|
      @options << [menu.name, menu.id]
    end

    # puts @options
    render "index"
  end
end