Rails.application.routes.draw do
  resources :books
  root "welcome#homepage"

  resources :users,    only: [:new, :create, :show]
  resources :sessions, only: [:new, :create] do
    delete :destroy, to: :destroy, on: :collection, as: :destroy
  end
end
