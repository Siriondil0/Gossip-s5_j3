Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/contact', to: "contact#show"  
  get '/team', to: "team#index"
  resources :registration
  get '/home', to: 'home#index'
  get '/home/login',to: 'home#login'
  post '/home/login',to: 'home#check'
  resources :gossip
  resources :home
  post '/gossip/comment', to: "comment#create"
  patch '/comment/:id/update', to: "comment#update"
  resources :comment  
end
