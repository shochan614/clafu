Rails.application.routes.draw do
  root to: "menus#index"
  resources :menus, only: :index
  resources :schools, only: [:new, :create]
end