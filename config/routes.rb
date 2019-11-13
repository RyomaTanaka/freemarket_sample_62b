Rails.application.routes.draw do
  devise_for :users
  root to: "personal_registrations#credit_registration"

# credit_registration
# profile_edit
# personal
# logout

end
