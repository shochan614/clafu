Rails.application.routes.draw do
  devise_for :users
  root to: "menus#index"
  resources :menus, only: :index
  resources :schools, only: [:new, :create]
  resources :class_rooms, only: [:new, :create]
end