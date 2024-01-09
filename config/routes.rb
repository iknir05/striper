Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  namespace :admin do
    get '/login' , to: 'session#new' 
    post '/login' , to: 'session#login' 
    get '/home' , to: 'dashboard#home'
    delete '/logout', to: 'session#destroy'
    resources :menus
    resources :sliders
    resources :facilities
    resources :jobs
    resources :reviews
    resources :news
    resources :benefits
    resources :galleries

  end

  delete '/logout', to: 'session#destroy'
  get 'session/index'
  get 'home/index'
  get 'home/about'
  get 'home/contact'
  
end
