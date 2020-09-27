Rails.application.routes.draw do
  root 'static_pages#top'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/show'
  get 'users/create'
  get 'static_pages/top'
  get '/about', to: 'static_pages#about'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
