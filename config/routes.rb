Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root "items#index"
  resources :items
  resource :signups do
    get :step0
    get :step1
    get :step2
    get :step3
    get :step4
  end
  resources :cards
end