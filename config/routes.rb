require 'sidekiq/web'

Neologist::Engine.routes.draw do
  resources :gists
  mount Sidekiq::Web => '/jobs'
end
