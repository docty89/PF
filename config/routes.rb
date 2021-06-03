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

  namespace :admins do

  end

  scope module: :public do
    root to: 'homes#top'
    resources :posts
    # resources :users, only: [:show, :edit, :update]
  end
    resources :users, only: [:show, :edit, :update]

end