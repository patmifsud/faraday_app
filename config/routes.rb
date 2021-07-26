Rails.application.routes.draw do
  root :to => 'pages#home'
  get 'session/new'

  resources :users, :only => [:new, :create, :index]
  get '/f/:slug' => 'feeds#view', :as => :feed
  get '/feeds/' => 'feeds#browse', :as => :all_feeds

  resources :feeds, :only => [:new, :create]
  resources :posts, :only => [:create]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
