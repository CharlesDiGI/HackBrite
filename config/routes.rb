Rails.application.routes.draw do

  get 'participations/new'
  get 'participations/index'
  get 'participations/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  resources :events, :path => '/'
  resources :users
  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
