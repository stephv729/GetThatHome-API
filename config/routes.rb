Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    sessions: "sessions"
  }
  # devise_for :users

  resources :properties, only: %i[index show create update]
  resources :property_types, only: %i[index]
  # resources :sessions, only: %i[create destroy
end
