Inoride::Application.routes.draw do
  
  resources :maps
  resources :users
  resources :rides
  resources :sessions
  
  get "maps/ride_route"
  #get "sign_up" => "users#new", :as => "sign_up"
  root :to => 'static_pages#home'
  
  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/signup', to: 'static_pages#signup'
  match '/signin', to: 'static_pages#signin'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match '/auth/failure', to: 'static_pages#help'
  match '/search', to: 'search#search_rides', as: 'search'

end
