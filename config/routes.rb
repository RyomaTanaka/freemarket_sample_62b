Rails.application.routes.draw do
  devise_for :users
  root to: "personal_registrations#purchase_confirmation"

# credit_registration
# profile_edit
# personal
# logout

end
