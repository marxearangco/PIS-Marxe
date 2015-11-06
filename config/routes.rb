PIS::Application.routes.draw do

  get "appointment/calendar"
  post "patient/create"
  get "users/sign_out"
  get "welcome/new"

  devise_for :users
  resources :patient
  resources :patient do
    member do
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
