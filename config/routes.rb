Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'

  resources :users
  resources :sessions

  #namespace :api, defaults: { format: :json } do
    #resources :users do
      #resources :lists, only: [:create, :update]
    #end

    #resources :lists, only: [:destroy, :index, :show] do
      #resources :items, only: [:create, :update]
    #end
    #resources :items, only: [:destroy, :index, :show]
  #end

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists, only: [:create]
    end

    resources :lists, except: [:create] do
      resources :items, only: [:create]
    end
    resources :items, except: [:create]
  end

  # Sign-In stuff
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  mount Knock::Engine => "/knock"

end
