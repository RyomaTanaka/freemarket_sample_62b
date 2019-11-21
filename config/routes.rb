Rails.application.routes.draw do

  # get 'purchase' => 'items#purchase'
  # get 'profile_edit' => 'mypages#profile_edit'
  # get 'personal' => 'mypages#personal'
  # get 'logout' => 'mypages#logout'
  # get 'mypage' => 'mypages#index'
  # get 'mypages/credit_registration'
  # get 'user/index'
  # get 'item-detail' => 'items#show'
  # get 'items-new' => 'items#new'
  # get 'item-edit' => 'mypages#item_edit'
 
  # get 'exhibited' => 'mypages#exhibited'  



  # get 'items/:id/edit'  => 'mypages#item_edit'

  

  devise_for :users
  root "items#index"

  devise_scope :user do
    
    get "sign_up/login", :to => 'users/registrations#login'
   
  end

  resources :mypages do
  end


  resources :items do
    collection do
      get "show" => "items#show"
      get "exhibited_lists" => "items#exhibited_lists"
      get "exhibited" => "items#exhibited"
      delete 'items/:id' => 'items#destroy'
      get "edit" => "items#edit"
      get ":id/purchase" => "items#purchase"
      # post "show" => 
      # post "delete"
      # ... "edit"
      # ... "update"
    end
  end
end
