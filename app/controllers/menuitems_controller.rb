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

    menuitem = Menuitem.create!(
      menu_id: menu_id,
      name: name,
      description: description,
      price: price
    )
    render plain: "new menuitem create with id #{menuitem.id}"
  end

end