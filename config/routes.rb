Rails.application.routes.draw do
  resources :rentals
  resources :images
  resources :cars

  resources :users
  post "/login", to: "users#login"
end
