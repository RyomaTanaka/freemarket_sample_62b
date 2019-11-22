Rails.application.routes.draw do

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root "items#index"
  resources :items do
    collection do
      # get 'mypages/:id' => 'mypages#index'
      get "show" => "items#show"
      get "exhibited_lists/:id" => "items#exhibited_lists"
      get "exhibited/:id" => "items#exhibited"
      delete 'items/:id' => 'items#destroy'
      get "/items/:id/edit" => "items#edit"
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'

      # post "show" => 
      # post "delete"
      # ... "edit"
      # ... "update"
    end
  end

  resource :signups do
    get :step0
    get :step1
    get :step2
    get :step3
    get :step4
  end
  resources :cards
  
  get 'profile_edit' => 'mypages#profile_edit'
  get 'personal' => 'mypages#personal'
  get 'logout' => 'mypages#logout'
  get 'mypage' => 'mypages#index'
  get 'mypages/credit_registration'
  get 'user/index'
  get 'item-detail' => 'items#show'
  get 'items-new' => 'items#new'
  
  
  get 'address' => 'mypages#address'
  get 'card' => 'mypages#card'
  get 'complete' => 'mypages#complete'
  get 'edit' => 'mypages#edit'
  get 'new' => 'mypages#new'
  get 'tele' => 'mypages#tele'

  # get 'items/:id/edit'  => 'mypages#item_edit'


  get 'users/:id'   =>  'users#show'

end
