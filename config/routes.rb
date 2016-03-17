Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'

  resources :users
  resources :sessions

  namespace :api, defaults: { format: :json } do
    resources :users
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  mount Knock::Engine => "/knock"

end
