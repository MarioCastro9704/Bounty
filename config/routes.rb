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
      get 'autocomplete' # Ruta para la acción de autocompletado
      get 'my_products', to: 'products#index', defaults: { mine: true }
    end
    resources :reviews, only: [:create]
    resources :ratings, only: [:create]
  end

  resources :purchases do
    collection do
      get 'checkout', to: 'purchases#checkout', as: 'checkout'
    end
  end

  resource :cart, only: [:show] do
    post 'add/:product_id', to: 'carts#add', as: 'add_to'
    post 'remove/:product_id', to: 'carts#remove', as: 'remove_from'
    patch 'update_item/:id', to: 'carts#update', as: 'update_item'
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
