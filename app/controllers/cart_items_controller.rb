class CartItemsController < ApplicationController
  def create
    menu_item_id = params[:menu_item_id]
    quantity = params[:quantity]

    cartitem = CartItem.new(
      menu_item_id: menu_item_id,
      user_id: session[:current_user_id],
      quantity: quantity
    )

    if cartitem.save
      redirect_to menus_path
    else
      flash[:error] = "Error while adding menu item to cart"
      redirect_to menus_path
    end
  end

  def destroy
    id = params[:id]
    CartItem.find(id).destroy
    redirect_to menus_path
  end
end