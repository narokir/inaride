Inoride::Application.routes.draw do
  
  resources :maps
  resources :users
  resources :rides
  resources :sessions, only: [:new, :create, :destroy]
  
  get "maps/ride_route"
  root :to => 'static_pages#home'
  
  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  
  match '/signup', to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  match 'auth/:provider/callback', to: 'sessions#facebook_login'
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match '/auth/failure', to: 'static_pages#help'
  match '/search', to: 'search#search_rides', as: 'search'

end