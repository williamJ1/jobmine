Rails.application.routes.draw do
  # get 'profiles/create'
  #
  # get 'profiles/save'
  #
  # get 'profiles/read'
  #
  # get 'profiles/update'
  #
  # get 'profiles/delete'
  # TODO: setting profile create action as default home page for now, change to formal front page later
  #root 'profiles#create'

  resources :users
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
