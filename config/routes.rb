Rails.application.routes.draw do

  
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

  

  devise_for :users
  root "items#index"

  devise_scope :user do
    
    get "sign_up/login", :to => 'users/registrations#login'
    
   
  end

  # resources :mypages do
  # end


get 'users/:id'   =>  'users#show'

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
end
