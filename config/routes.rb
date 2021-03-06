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
      get :list_likes_items
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
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      post :purchase
      get :purchase_confirmation
      get :purchase_complete
    end
  end
  
  post   '/like/:item_id' => 'likes#like',   as: 'like'
  delete '/like/:item_id' => 'likes#unlike', as: 'unlike'
end