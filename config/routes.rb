Rails.application.routes.draw do


  get 'user/index'
  devise_for :users
  root "items#index"
  resources :items
end
