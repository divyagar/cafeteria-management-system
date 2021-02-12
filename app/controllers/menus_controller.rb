class MenusController < ApplicationController
  def change_menu
    @page = "Change menu"
    @menus = Menu.all
    current_user
    @options = []
    menus = Menu.all
    menus.each do |menu|
      @options << [menu.name, menu.id]
    end

    render "index"
  end

  def index
    @page = "Menu"
    @menus = Menu.all
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