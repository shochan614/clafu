Rails.application.routes.draw do
  devise_for :admins #管理者
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/guest_sign_in', to: 'users/sessions#new_guest' #ゲストユーザー用ログインアクション
  end
  root to: "class_rooms#index"
  resources :schools, only: [:new, :create] #学校登録
  resources :class_rooms, only: [:index, :new, :create, :show] do #学級登録
    resources :messages, only: [:index, :create, :destroy] #チャット
    resources :posts, only: [:index, :new, :create] #学級通信
    resources :users, only: [:show, :edit, :update] #ユーザー情報
    resources :calendars, only: :show #カレンダー
  end

end