class MenuitemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "This is index page"
  end

  def create
    menu_id = params[:menu_id]
    name = params[:name]
    description = params[:description]
    price = params[:price]

    menuitem = Menuitem.new(
      menu_id: menu_id,
      name: name,
      description: description,
      price: price
    )

    if menuitem.save
      redirect_to menus_path
    else
      flash[:error] = menuitem.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

end