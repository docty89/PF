Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    root 'homes#top'
    resources :posts, only: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end


  scope module: :public do
    root 'homes#top'

    resources :posts do
      resource :favorites, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end

    resources :users, only: [:show, :edit, :update] do
      member do
        get :quit_confirm
        patch :quit
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get :favorites
      resources :chats, only: [:create, :index]
    end
    resources :notifications, only: :index do
      collection do
        delete 'destroy_all'
      end
    end


    get 'chat/:id' => 'chats#show', as: 'chat'
  end


end