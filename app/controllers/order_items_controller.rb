class OrderItemsController < ApplicationController

  def create
    if current_order
      menu_item_id = params[:menu_item_id]
      menu_item_name = params[:menu_item_name]
      menu_item_price = params[:menu_item_price]
      quantity = params[:quantity]

      orderitem = OrderItem.new(
        order_id: session[:order_id],
        menu_item_id: menu_item_id,
        menu_item_name: menu_item_name,
        menu_item_price: menu_item_price,
        quantity: quantity
      )

      if orderitem.save
        current_order
        order = @current_order
        order.total_amount = order.total_amount + (Integer(menu_item_price) * Integer(quantity))
        order.save()
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
    order = OrderItem.find(orderitem_id)
    current_order
    @current_order.total_amount = @current_order.total_amount - (order.quantity * order.menu_item_price)
    @current_order.save()
    order.destroy
    redirect_to menus_path
  end
end