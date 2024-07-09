Rails.application.routes.draw do
  devise_for :admins

  root 'products#index'
  resources :products
  resource :cart, only: [:show, :update, :destroy,:create]
  get 'check_cart', to: 'carts#check_cart'
end
