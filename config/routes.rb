Rails.application.routes.draw do
  devise_for :users
  root to: "mypages#profile_edit"


end
