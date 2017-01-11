Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root 'tasks#index'

  resources :tasks do

    put :complete, on: :member


    collection do
      delete :destroy_multiple
    end
  end
end
