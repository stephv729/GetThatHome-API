<<<<<<< HEAD
Rails.application.routes.draw do
<<<<<<< Updated upstream
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :addresses, only: %i[index]

  # Defines the root path route ("/")
  # root "articles#index"
=======
=======
# frozen_string_literal: true

Rails.application.routes.draw do
>>>>>>> testing_override
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    sessions: "sessions"
  }
  # devise_for :users
<<<<<<< HEAD
  resources :properties, only: %i[index show create update]
  resources :property_types, only: %i[index]
  # resources :sessions, only: %i[create destroy]
>>>>>>> Stashed changes
=======
  resources :properties, only: %i[index show update]
  resources :property_types, only: %i[index]
  # resources :sessions, only: %i[create destroy]
>>>>>>> testing_override
end
