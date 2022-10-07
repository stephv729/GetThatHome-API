Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    sessions: "sessions",
    registrations: "users"
  }
  # devise_for :users

  resources :properties, only: %i[index show create update destroy]
  resources :property_types, only: %i[index]
  resources :saved_properties, only: %i[index update]
  
  get 'my_properties', :to => 'users#my_properties'
  get 'profile', :to => 'users#show'
  #get “/my_properties”, to: “users#my_properties”
  # resources :sessions, only: %i[create destroy
end
