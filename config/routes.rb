Rails.application.routes.draw do
  devise_for :users

  resources :products
  get "/account/:id", to: "pages#account", as: "show_account"
  root "pages#home"
end
