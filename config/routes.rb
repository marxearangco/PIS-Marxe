PIS::Application.routes.draw do
  # get "appointment/index"
  # get "appointment/create"
  # get "appointment/update"
  # get "appointment/destroy"
  # get "appointment/new"
  # get "appointment/edit"
  # get "information/index"
  # get "information/show"
  # get "information/create"
  # get "information/update"
  # get "information/destroy"
  # get "information/new"
  # get "information/edit"
  get "appointment/calendar"
  post "patient/create"
  get "users/sign_out"
  get "welcome/new"
  devise_for :views
  devise_for :users
  # devise_for :appointments
  resources :patient
  resources :patient do
    member do
      # resources :diagnosis
      resources :information
      get "set_appointment"
      post "update"
      get "edit_image"
      patch "update_image"
    end
  end
  resources :appointment, as: 'appointments'

  root 'patient#startup'

end
