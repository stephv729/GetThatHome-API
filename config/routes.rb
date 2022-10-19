Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    sessions: "sessions",
    registrations: "registrations"
  }
  # devise_for :users
  root :to => "main#index"
  resources :properties, only: %i[index show create update destroy]
  resources :property_types, only: %i[index]
  resources :saved_properties, only: %i[index update create]
  resources :users, only: %i[show]
  
  get 'my_properties', :to => 'users#my_properties'
  get 'profile', :to => 'users#profile'
  # post 'auth/sign_up', :to => 'users#create'
  #get “/my_properties”, to: “users#my_properties”
  # resources :sessions, only: %i[create destroy
end
