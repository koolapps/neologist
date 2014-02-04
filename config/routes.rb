require 'sidekiq/web'

Neologist::Engine.routes.draw do
  resources :documents

  resources :gists
  mount Sidekiq::Web => '/jobs'
end
