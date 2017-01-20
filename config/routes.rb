Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root 'tasks#index'

  resources :tasks do
    put :complete, on: :member
    collection do
      post :destroy_multiple
      get 'completed_tasks'
    end
  end
end