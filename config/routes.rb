Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:show]
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  root "books#index"
end
