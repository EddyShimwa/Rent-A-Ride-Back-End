Rails.application.routes.draw do

  resources :rentals
  resources :images
  resources :cars
  resources :favorites

  resources :users
  post "/login", to: "users#login"
end
