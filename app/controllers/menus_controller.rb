class MenusController < ApplicationController
  def change_menu
    @page = "Modify menu"
    @menus = Menu.all
    current_user

    render "index"
  end

  def change_menu_items
    @page = "Modify menu items"
    @menus = Menu.all
    current_user
    @options = []
    @menus.each do |menu|
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

  def create
    name = params[:name]
    menu = Menu.new(
      name: name
    )

    if menu.save
      flash[:success] = "Menu #{name} is created"
      redirect_to change_menus_path
    else
      flash[:error] = "Error while creating menu"
      redirect_to change_menus_path
    end
  end

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    menuitems = menu.menu_items
    menuitems.destroy_all
    menu.destroy
    redirect_to change_menus_path
  end

end