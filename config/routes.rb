Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :users
  resources :products do
    collection do
      get 'catalog'
      get 'autocomplete'
      get 'my_products', to: 'products#index', defaults: { mine: true }
    end
    resources :reviews, only: [:create]
    resources :ratings, only: [:create]
  end

  resources :purchases do
    member do
      get 'confirmation', to: 'purchases#confirmation', as: 'confirmation'
    end
    collection do
      get 'checkout', to: 'purchases#checkout', as: 'checkout'
    end
  end

  resource :cart, only: [:show] do
    post 'add/:product_id', to: 'carts#add', as: 'add_to'
    post 'remove/:product_id', to: 'carts#remove', as: 'remove_from'
    patch 'update_item/:id', to: 'carts#update', as: 'update_item'
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
