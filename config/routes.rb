Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/new'
  get 'sessions/create'
  post 'sessions/create'
  delete 'sessions/destroy'

  resources :users do
    resources :missions
    # get ":status", to: "users#show"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
