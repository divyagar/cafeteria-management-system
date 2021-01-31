class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def create
    current_user
    user_id = @current_user.id
    order = Order.new(
      user_id: user_id
    )

    if order.save
      session[:order_id] = order.id
      redirect_to menus_path
    else
      flash[:error] = "some error occurred while creating order"
      redirect_to menus_path
    end
  end
end