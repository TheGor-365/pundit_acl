Rails.application.routes.draw do
  root "welcome#homepage"

  resources :users,    only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
