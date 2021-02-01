class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render plain: "User index page"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    role = params[:role]

    if(role == "Owner" && params[:code] != "changeme")
      flash[:error] = "Invalid secret code"
      redirect_to new_user_path
    else
      user = User.new(
        name: name,
        email: email,
        password: password, 
        role: role
      )

      if user.save
        session[:current_user_id] = user.id        
        redirect_to menus_path
      else
        flash[:error] = "Error while signing up"
        redirect_to "/"
      end
    end
  end

  def new
    render "new"
  end
end