Rails.application.routes.draw do


  get 'comments/create'
  get 'comments/new'
  get 'user/index'
  devise_for :users
  root "items#index"
  resources :items do
    resources :comments
  end
end
