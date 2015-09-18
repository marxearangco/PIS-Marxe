PIS::Application.routes.draw do
  get "appointment/index"
  get "appointment/create"
  get "appointment/update"
  get "appointment/destroy"
  get "appointment/new"
  get "appointment/edit"
  get "information/index"
  get "information/show"
  get "information/create"
  get "information/update"
  get "information/destroy"
  get "information/nnew"
  get "information/edit"
  devise_for :views
  devise_for :users
  # devise_for :appointments
  resources :patients do
 	  member do
      resources :diagnosis
      
    end
  end
  resources :information
  resources :appointment, as: 'appointments'

  root 'patients#startup'

end
