Rails.application.routes.draw do
  # Define the root path route ("/")
  root to: "pages#home"

  # Devise routes for users
  devise_for :users

  # RESTful routes for users, products, and purchases
  resources :users
  resources :products do
    collection do
      get 'catalog'
      get 'my_products', to: 'products#index', defaults: { mine: true }
    end
    resources :reviews, only: [:create]
    resources :ratings, only: [:create]
  end

  resources :purchases do
    collection do
      get 'checkout/:product_id', to: 'purchases#checkout', as: 'checkout'
    end
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
