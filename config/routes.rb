Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "class_rooms#index"
  resources :schools, only: [:new, :create]
  resources :class_rooms, only: [:index, :new, :create, :show] do
  # resources :menus, only: :index do
    resources :messages, only: [:index, :create, :destroy]
  end

end