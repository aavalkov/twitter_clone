Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

 root :to => 'users#index'

 resources :users do
   resources :tweets
   resources :follows
 end

 resources :sessions, :only => [:new, :create]
 resources :tweets


end
