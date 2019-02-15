Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  # resources :events, :path => '/'
  resources :users do
    resources :avatars, only: [:create]
  end
  
  resources :events do
    resources :attendances
    resources :charges, only: [:new, :create]
    resources :event_pics, only: [:create]
  end
  
  namespace :admin do
    root 'admin#index'
    # resources :admins, only: [:index]
    resources :users
  end

end
