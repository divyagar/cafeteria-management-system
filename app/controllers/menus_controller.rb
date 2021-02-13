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
    @cartitems = @current_user.cart_items

    render "index"
  end
end