Rails.application.routes.draw do
  devise_for :users
  resources :products
  root "pages#home"
end
