Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/new'
  get 'sessions/create'
  # get 'users/new'
  # get 'users/create'
  # post 'users/create'
  post 'sessions/create'
  resources :missions
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
