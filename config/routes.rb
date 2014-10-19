Rails.application.routes.draw do
 root to: 'users#welcome'

 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 get '/logout', to: 'sessions#destroy'
 get '/register', to: 'users#new'
 
 resources :users, only: [:create, :index, :show]
 resources :goals, only: [:new, :destroy, :edit, :update, :create]
 
end
