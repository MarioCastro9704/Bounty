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
    end
  end
  resources :purchases

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Define other routes
  get 'home/index'
end
