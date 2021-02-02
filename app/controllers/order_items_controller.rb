class OrderItemsController < ApplicationController

  def create
    if current_order
      menu_item_id = params[:menu_item_id]
      menu_item_name = params[:menu_item_name]
      menu_item_price = params[:menu_item_price]

      orderitem = OrderItem.new(
        order_id: session[:order_id],
        menu_item_id: menu_item_id,
        menu_item_name: menu_item_name,
        menu_item_price: menu_item_price
      )

      if orderitem.save
        redirect_to menus_path
      else
        flash[:error] = "some error occured while adding item to order"
        redirect_to menus_path
      end

    else
      flash[:error] = "Please create order first"
      redirect_to menus_path
    end
  end

  def destroy
    orderitem_id = params[:id]
    OrderItem.find(orderitem_id).destroy
    redirect_to menus_path
  end
end