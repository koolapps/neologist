require 'sidekiq/web'

Rust::Engine.routes.draw do
  resources :gists
  mount Sidekiq::Web => '/jobs'
end
