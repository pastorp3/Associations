Rails.application.routes.draw do
  resources :events
  resources :users
  post '/access', to: 'access_control#sign_in'
  get '/access', to: 'access_control#log_out'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
end
