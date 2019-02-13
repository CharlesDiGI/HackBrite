Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  # resources :events, :path => '/'
  resources :users
  resources :events do
    resources :attendances
    resources :charges, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
