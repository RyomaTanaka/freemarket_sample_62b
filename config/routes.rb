Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  resource :signups, only:[:create] do
    get :step0
    get :step1
    get :step2
    get :step3
    get :step4
    get :step5
  end
  
  resources :mypages, only:[:show] do
    member do
      get :list_items
      get :list_items_progress
      get :list_items_completed
      get :purchase
      get :purchased
      get :profile
      get :card_create
      get :personal
      get :logout
    end
  end
  
  root "items#index"
  
  resources :users do
    resources :cards
  end
  
  resources :items
end
