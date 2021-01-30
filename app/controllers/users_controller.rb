class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
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

      user.save()
      redirect_to "/menu"
    end
  end

  def new
    current_user
    render "new"
  end
end