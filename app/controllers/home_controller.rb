class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    # puts @current_user.email
    if current_user
      redirect_to menus_path
    else
      render "index"
    end
  end

end