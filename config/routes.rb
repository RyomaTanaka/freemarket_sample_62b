Rails.application.routes.draw do

  devise_for :users
  root "items#index"

  devise_scope :user do
    
    get "sign_up/login", :to => 'users/registrations#login'
    
   
  end
        get "card" => "users#card"

      resources :users do

        get "show" => "users#show"
        get 'exhibited_lists'   =>  'users#exhibited_lists'
        get 'exhibited'   =>  'users#exhibited'
       resources :items

      end

      get 'users/:id/profile_edit'   =>  'users#profile_edit'
      get 'users/:id/logout'   =>  'users#logout'
      get 'users/:id/credit_registration'   =>  'users#credit_registration'
      get 'users/:id'   =>  'users#show'
      get 'users/:id/personal'   =>  'users#personal'


  resources :items do
    collection do
      # get 'mypages/:id' => 'mypages#index'
      get "show" => "items#show"
      get "exhibited_lists/:id" => "items#exhibited_lists"
      get "exhibited/:id" => "items#exhibited"
      delete 'items/:id' => 'items#destroy'
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'

      # post "show" => 
      # post "delete"
      # ... "edit"
      # ... "update"
    end
  end
end
