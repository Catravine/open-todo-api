Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'

  resources :users
  resources :sessions

  mount Knock::Engine => "/knock"

end
