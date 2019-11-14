Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    get "sign_up/tele", :to => 'users/registrations#tele'
    get "sign_up/address", :to => 'users/registrations#address'
  end



end
