Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
root 'tasks#index'

  resources :tasks do
put :complete, on: :member
end
end
