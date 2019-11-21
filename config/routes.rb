Rails.application.routes.draw do
  
  devise_for :users
  root "items#index"

  devise_scope :user do

    get "sign_up/login", :to => 'users/registrations#login'
    
  end

  resources :items

  get 'users/:id'   =>  'users#show'

end
