Rails.application.routes.draw do
  get "/" => "home#index"
  resources :menuitems

  get "/signup" => "users#new", as: :new_users
  post "/signup" => "users#create", as: :users
  
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
