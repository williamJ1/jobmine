Rails.application.routes.draw do

  #post 'contract/create'

  get 'password_reset/new'

  get 'password_reset/edit'

  get 'shared/about'

  get 'shared/terms_of_service'

  get 'shared/privacy_policy'

  get 'shared/site_map'

  get 'shared/contact_us'

  get 'shared/faq'

  get 'teen_job_detail/show'

  get 'employer_job_detail/show'

  post '/create_contract', to: 'contract#create'

  post '/close_contract', to: 'contract#close'

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
  get '/logout', to: 'login#logout'

  get '/signup', to: 'users#new'


  resources :profiles
  get '/check_profile', to: 'profiles#check_profile'
  get '/show_profile', to: 'profiles#show'

  resources :teen_job_details
  #get '/show_teen_job_detail', to: 'teen_job_detail#show'

  resources :reviews
  resources :payments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/contract/:contract_id/timeslot', to: 'timeslot#display', as: 'show_timeslot'
  post '/contract/:contract_id/timeslot', to: 'timeslot#add', as: 'add_timeslot'
  get '/contract/:contract_id/update_timeslot', to: 'timeslot#update', as: 'update_timeslot'
  put '/contract/:contract_id/approve_timeslot', to: 'timeslot#approve', as: 'approve_timeslot'
  put '/contract/:contract_id/reject_timeslot', to: 'timeslot#reject', as: 'reject_timeslot'


  resources :password_reset




end
