Rails.application.routes.draw do
  devise_for :users

  resources :products
  get "/account/:id", to: "pages#account", as: "show_account"
  get "/products/:id/checkout", to: "pages#checkout", as: "checkout_product"
  root "pages#home"
end
