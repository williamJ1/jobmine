Rails.application.routes.draw do
  get 'teen_job_detail/show'

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

  resources :teen_job_details
  #get '/show_teen_job_detail', to: 'teen_job_detail#show'

  resources :reviews
  resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teenage_jobs/', to: 'teenage#show_jobs'
end
