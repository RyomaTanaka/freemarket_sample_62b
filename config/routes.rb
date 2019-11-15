Rails.application.routes.draw do
  devise_for :users
  root to: "mypages#credit_registration"


end
