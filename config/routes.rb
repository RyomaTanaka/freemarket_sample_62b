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
  
  resources :mypages, only:[:show, :edit, :update] do
    member do
      get :list_items
      get :list_items_progress
      get :list_items_completed
      get :purchase
      get :purchased
      get :profile
      get :card
      get :card_create
      get :personal
      get :logout
      post :logout
    end
  end

  resources :addresses
  
  root "items#index"
  
  resources :users do
    resources :cards
  end

  get "search" => "items#item_search"

  resources :items do
    member do
      get :purchase_complete
    end
  end
end
