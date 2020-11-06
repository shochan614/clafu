Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "menus#index"
  resources :menus, only: :index
  resources :schools, only: [:new, :create]
  resources :class_rooms, only: [:new, :create]
end