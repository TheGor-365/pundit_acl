Rails.application.routes.draw do
  root "welcome#homepage"

  resources :users, only: [:new, :create, :show]

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
end
