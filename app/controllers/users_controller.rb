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
        if current_user && @current_user.role == "Owner"
          flash[:success] = "User #{name} has been created."
          redirect_to "/signup"
        else
          session[:current_user_id] = user.id
          redirect_to menus_path
        end
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to new_users_path
      end
    end
  end

  def new
    if current_user && @current_user.role != "Owner"
      redirect_to menus_path
    else
      @options = ["User", "Owner"]
      if current_user && @current_user.role == "Owner"
        @page = "Add User"
        @options << "Billing clerk"
      end
      render "new"
    end
  end
end