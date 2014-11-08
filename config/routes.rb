Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#callback'
  get '/signout' => 'sessions#destroy'
end
