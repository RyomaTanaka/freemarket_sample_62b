Rails.application.routes.draw do

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
      get "edit" => "items#edit"
      get ":id/purchase" => "items#purchase"
      # post "show" => 
      # post "delete"
      # ... "edit"
      # ... "update"
    end
  end
end
