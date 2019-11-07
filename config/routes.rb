Rails.application.routes.draw do
  devise_for :users

  resources :products
  get "/account/", to: "pages#account", as: "show_current_account"
  get "/products/:id/checkout", to: "pages#checkout", as: "checkout_product"
  get "/payments/success", to: "payments#success", as: "success_payment"
  get "/payments/failure", to: "payments#failure", as: "failure_payment"
  post "/payments/webhook", to: "payments#webhook"

  root "pages#home"
end
