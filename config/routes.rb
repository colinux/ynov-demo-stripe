Rails.application.routes.draw do
  resources :books, only: [:show]

  root "books#index"
end
