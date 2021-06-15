Rails.application.routes.draw do
  get 'maps/index'
  devise_for :admins
  devise_for :users

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
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get :favorites
    end

    resources :maps, only: [:index]

    get 'chat/:id' => 'chats#show', as: 'chat'
    resources :chats, only: [:create]
  end

  get '/search' => 'search#search'

end