Rails.application.routes.draw do
  root 'sessions#new'

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  put '/set_session_locale' => 'application#set_session_locale'

  get '/location_search', to: 'location#search'

  get '/users/:username', to: 'users#show'
  resources :users, only: [:index, :new, :create, :edit, :update] do
    post 'images', to: 'users#create_image', as: 'images'
    delete 'image/:image_id', to: 'users#delete_image', as: 'delete_image'
    put 'ajax_update', on: :member
  
    resources :user_books, only: [:create, :destroy]
    resources :user_interests, only: [:create, :destroy]
    resources :user_spiritual_gifts, only: [:create, :destroy]
    resources :user_callings, only: [:create, :destroy]
    resources :user_church_responsibilities, only: [:create, :destroy]
    resources :user_languages, only: [:create, :destroy]
  end

  resources :conversations, only: [:index, :show, :create, :destroy] do
    resources :messages, only: [:create, :edit, :update, :destroy]
  end
end
