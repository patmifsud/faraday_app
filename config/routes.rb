Rails.application.routes.draw do
  root :to => 'pages#home'
  get 'session/new'

  get '/f/:slug' => 'feeds#view', :as => :feed
  delete '/f/:slug' => 'feeds#destroy', :as => :delete_feed
  get '/feeds/edit/:slug' => 'feeds#edit', :as => :edit_feed
  post '/feeds/edit/:slug' => 'feeds#update', :as => :update_feed


  resources :feeds, :only => [:new, :create]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :posts, :only => [:create]
  get '/posts/:id' => 'posts#view'
  delete '/posts/:id' => 'posts#destroy'

  resources :users, :only => [:new, :create]
  get '/u/:id' => 'users#view', :as => :user_home

<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
end
