Rails.application.routes.draw do
  devise_for :users
  root to: 'order_products#index'
  resources :order_products, only: [:index]
  # post routes for filtering by country
  post 'order_products_filter', action: :index, controller: 'order_products_filter'
  # access to blazer sql queries if user is admin
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
end
