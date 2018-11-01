# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  post '/clone', to: 'welcome#clone'
  post '/push', to: 'welcome#push'
end
