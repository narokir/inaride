Inoride::Application.routes.draw do
  root :to => 'static_pages#home'
  
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :rides
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  
  
  

  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/find', to: 'static_pages#find_rides', as: 'find'
  match '/rides/users/auth/facebook/callback', to: 'rides#create'
  
  
  #match '/signup', to: 'users#new'
  #match '/signin',  to: 'sessions#new'
  #match '/signout', to: 'sessions#destroy', via: :delete
  
  #match '/users/auth/facebook/callback', to: 'static_pages#home'
  #match 'signout', to: 'sessions#destroy', as: 'signout'
  #match '/auth/failure', to: redirect('/')
  match '/search', to: 'search#search_rides', as: 'search'
  
  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

end