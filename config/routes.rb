Rails.application.routes.draw do
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  resource :cart, only: [:show, :destroy] do
    post 'add_item/:product_id', to: 'carts#add_item', as: 'add_item'
    post 'add_item_cart/:product_id', to: 'carts#add_item_cart', as: 'add_item_cart'
    delete 'remove_item/:product_id', to: 'carts#remove_item', as: 'remove_item'
    delete 'empty_cart', to: 'carts#empty_cart', as: 'empty'
    patch 'decrease_quantity'
  end
  
  # Catch-all route for handling non-existent routes
  match "*path", to: "application#render_404", via: :all, constraints: lambda { |req| !req.path.start_with?('/assets') && !req.path.start_with?('/rails') }

  # Defines the root path route ("/")
  root "products#index"
end
