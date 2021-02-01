class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  
  def new
    render "new"
  end

  def create
    user = User.find_by(email: params[:email])
    if(user && user.authenticate(params[:password]))
      session[:current_user_id] = user.id
      redirect_to menus_path
    else
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    session[:order_id] = nil
    @current_order = nil
    redirect_to "/"
  end

  def update
    current_order
    session[:order_id] = nil
    @current_order = nil
    redirect_to menus_path
  end

end