Rails.application.routes.draw do
  get 'password_reset/new'

  get 'password_reset/edit'

  resources :jobs
  # get 'profiles/create'
  #
  # get 'profiles/save'
  #
  # get 'profiles/read'
  #
  # get 'profiles/update'

  root to: 'welcome#home'

  resources :users
  get '/login', to: 'login#new'
  post '/login', to: 'login#create'

  get '/signup', to: 'users#new'


  resources :profiles
  get '/check_profile', to: 'profiles#check_profile'
  get '/show_profile', to: 'profiles#show'

  resources :reviews
  resources :payments

  resources :password_reset,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
