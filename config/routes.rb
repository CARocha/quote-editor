# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes
end
