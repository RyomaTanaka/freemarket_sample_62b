Rails.application.routes.draw do

  get 'purchase' => 'items#purchase'
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






  devise_for :users
  root "items#index"
  resources :items do
    collection do
      get "show" => "items#show"
    end
  end
end
