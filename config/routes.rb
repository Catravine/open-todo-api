Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'

  resources :users
  resources :sessions

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :index] do
      resources :lists, only: [:create, :index, :show, :update]
    end

    resources :lists, only: [:destroy] do
      resources :items, only: [:create, :index, :show, :update]
    end
    resources :items, only: [:destroy]
  end

  # Sign-In stuff
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  mount Knock::Engine => "/knock"

end
