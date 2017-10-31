Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
