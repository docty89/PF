Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # root to: 'homes#top'
  # devise_for :admins, controllers: {
  #   sessions:      'admins/sessions',
  #   passwords:     'admins/passwords',
  #   registrations: 'admins/registrations'
  # }
  # devise_for :users, controllers: {
  #   sessions:      'users/sessions',
  #   passwords:     'users/passwords',
  #   registrations: 'users/registrations'
  # }

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'

    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update] do
      member do
        get :quit_confirm
        patch :quit
      end
    end

    get 'chat/:id' => 'chats#show', as: 'chat'
    resources :chats, only: [:create]
  end

end