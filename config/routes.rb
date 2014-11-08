Rails.application.routes.draw do

  get 'session/new'
  root to: 'sessions#new'

  get '/auth/:provider/callback' => 'sessions#callback'
  get '/signout' => 'sessions#destroy'
end
