class MenuItemsController < ApplicationController
  def create
    menu_id = params[:menu_id]
    name = params[:name]
    description = params[:description]
    price = params[:price]

    menuitem = MenuItem.new(
      menu_id: menu_id,
      name: name,
      description: description,
      price: price
    )

    if menuitem.save
      menuitem.avatar.attach(params[:avatar])
      flash[:success] = "Menu item #{name} is created"
      redirect_to change_menus_items_path
    else
      flash[:error] = menuitem.errors.full_messages.join(", ")
      redirect_to change_menus_items_path
    end
  end

  def destroy
    id = params[:id]
    menuitem = MenuItem.find(id)
    name = menuitem.name
    if menuitem.destroy
      flash[:success] = "Menu item #{name} is deleted"
      redirect_to change_menus_items_path
    else
      flash[:error] = menuitem.error.full_messages.join(", ")
      redirect_to change_menus_items_path
    end
  end

end