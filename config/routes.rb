Rails.application.routes.draw do
  get "/" => "home#index"
  post "/orders/delivered/:id" => "orders#delivered", as: :order_delivered
  get "/change_menu" => "menus#change_menu", as: :change_menus
  get "/create_all_orders" => "order_items#create_all_orders", as: :create_all_orders
  resources :menu_items, :menus, :orders, :order_items, :checkouts, :cart_items

  get "/signup" => "users#new", as: :new_users
  post "/signup" => "users#create", as: :users
  
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  get "/confirm" => "orders#confirm", as: :confirm_order
  get "/sessions/update" => "sessions#update", as: :update_session

end
