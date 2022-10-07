Rails.application.routes.draw do
<<<<<<< Updated upstream
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :addresses, only: %i[index]

  # Defines the root path route ("/")
  # root "articles#index"
=======
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    sessions: "sessions"
  }
  # devise_for :users
  resources :properties, only: %i[index show create update]
  resources :property_types, only: %i[index]
  # resources :sessions, only: %i[create destroy]
>>>>>>> Stashed changes
end
