Rails.application.routes.draw do
  get 'user/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"
  
  get 'items' => 'items#index'
  get "items/create" => "items#create"

end
