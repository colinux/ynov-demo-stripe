Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:show]

  root "books#index"
end
