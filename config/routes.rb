# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  resources :properties, only: %i[index show]
  resources :sessions, only: %i[create destroy]
end
