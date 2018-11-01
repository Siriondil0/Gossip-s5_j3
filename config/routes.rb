Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/contact', to: "contact#show"  
  get '/team', to: "team#index"
  resources :registration
  resources :gossip
  resources :home
  post '/gossip/comment', to: "comment#create"
<<<<<<< HEAD
  patch '/comment/:id/update', to: "comment#update"
  
=======
  resources :comment  
>>>>>>> ced855f3d09cd08fe043ded27cebc30d6b3c1926
end
