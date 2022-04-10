Rails.application.routes.draw do
  devise_for :users
  root to: 'order_products#index'
  resources :order_products, only: [:index]
  post 'order_products_filter', action: :index, controller: 'order_products_filter'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
