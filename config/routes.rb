Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
end
