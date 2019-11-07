Rails.application.routes.draw do

  root "pages#home"

  # Devise & Product CRUD routes
  #
  devise_for :users
  resources :products

  # Custom routes for user account, payment results & webhook
  #
  get "/account/", to: "pages#account", as: "show_current_account"
  get "/payments/success", to: "payments#success", as: "success_payment"
  get "/payments/failure", to: "payments#failure", as: "failure_payment"
  post "/payments/webhook", to: "payments#webhook"

end
