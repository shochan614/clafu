Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/guest_sign_in', to: 'users/sessions#new_guest' #ゲストユーザー用ログインアクション
  end
  root to: "class_rooms#index"
  resources :schools, only: [:new, :create]
  resources :class_rooms, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create, :destroy]
    resources :posts, only: [:index, :new, :create]
    resources :users, only: [:show, :edit, :update]
  end

end