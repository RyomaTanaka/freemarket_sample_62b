Rails.application.routes.draw do
  get 'user/index'
  devise_for :users
  root "items#index"
  resources :items
  resource :signup do
    get :step1
    get :step1
    get :step1
    get :step1
  end
end
