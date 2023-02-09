Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'sessions#new'

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  put '/set_session_locale' => 'application#set_session_locale'

  get '/user/:username', to: 'users#show', as: 'user'
  resources :users, only: [:index, :new, :create, :edit, :update] do
    post 'images', to: 'users#create_image', as: 'images'
    delete 'image/:image_id', to: 'users#delete_image', as: 'delete_image'
  end
end
