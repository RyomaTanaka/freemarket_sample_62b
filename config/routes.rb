Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
    # collection do
    #   get 'categorie_children', defaults: { format: 'json' }
    #   get 'categorie_grandchildren', defaults: { format: 'json' }
    # end
  # end
  resource :signups do
    get :step1
    get :step2
    get :step3
    get :step4
  end
end