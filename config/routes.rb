Rails.application.routes.draw do
 
 

  root 'home#index'
  devise_for :users
  
  namespace :admin do
    get '/login' , to: 'session#new' 
    post '/login' , to: 'session#login'
    delete '/logout', to: 'session#destroy'

    get "/signup", to: "registration#new"
    post "/signup", to: "registration#create"

    get '/home' , to: 'dashboard#home'
    get '/enquiries', to: 'enquiries#index'

    get 'admin-confirm', to: "admin_users#confirm_admin" , as:'confirm'
    post 'admin-show', to: "admin_users#show_admin", as:'show'
    get 'notifications_reset', to: "notifications#notification_status_reset" , as:'notifications_reset'
    get 'notifications_read', to: "notifications#update_notification_read_status" , as:'update_notification_read_status'
    get 'notifications_count', to: "notifications#notifications_count" , as:'notifications_count'

    
    post '/menus/search', to: 'menus#search_filter'
    post '/sliders/search', to: 'sliders#search_filter'
    post '/facilities/search', to: 'facilities#search_filter'
    post '/jobs/search', to: 'jobs#search_filter'
    post '/reviews/search', to: 'reviews#search_filter'
    post '/news/search', to: 'news#search_filter'
    post '/benefits/search', to: 'benefits#search_filter'
    post '/galleries/search', to: 'galleries#search_filter'
    post '/enquiries', to: 'enquiries#search_filter'
    post '/blogs/search', to: 'blogs#search_filter'
    
    resources :menus
    resources :sliders
    resources :facilities
    resources :jobs
    resources :reviews
    resources :news
    resources :benefits
    resources :galleries
    resources :blogs
    resources :admin_users
    resources :notifications 
  end

  get 'like', to: 'home#like_manager', as: 'blog_like'
  get 'liked_users_list', to: 'home#liked_by_users', as: 'liked_users_list'
  get 'unliked_users_list', to: 'home#unliked_by_users', as: 'unliked_users_list'
  post 'create_enquiry', to: 'home#create'

  get 'home', to: 'home#index'
  get '/about', to: 'home#about'
  get '/services', to: 'home#services'
  get '/gallery', to: 'home#gallery'
  get '/contact', to: 'home#contact'
  get '/blogs', to: 'home#blogs'
  get '/estimate', to: 'home#estimate'
  get '/blog/:title', to: 'home#blog_details'

  delete '/logout', to: 'session#destroy'
  get 'session/index'

  
end
