class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    # puts @current_user.email
    if current_user
      redirect_to "/signup"
    else
      render "index"
    end
  end

end