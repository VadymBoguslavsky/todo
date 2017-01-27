Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}, :path_names => {
      :sign_in => 'signin',
      :sign_out => 'signout',
      :sign_up => 'signup'}

      resource :users

  get '/users/confirmation/new', to: 'devise/confirmations#new'
  root 'tasks#index'
  resources :tasks do
    put :complete, on: :member
    collection do
      post :destroy_multiple
      get 'completed_tasks'
    end
  end
end