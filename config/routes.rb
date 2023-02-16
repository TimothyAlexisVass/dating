Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'sessions#new'

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  put '/set_session_locale' => 'application#set_session_locale'

  get '/users/:username', to: 'users#show'
  resources :users, only: [:index, :new, :create, :edit, :update] do
    post 'images', to: 'users#create_image', as: 'images'
    delete 'image/:image_id', to: 'users#delete_image', as: 'delete_image'
    put 'ajax_update', on: :member
  
    resources :user_books, only: [:create, :destroy]
  end

  get '/location_search', to: 'location#search'
end
