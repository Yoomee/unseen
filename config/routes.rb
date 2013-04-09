Unseen::Application.routes.draw do

  root :to => 'home#index'
  resources :wireframes, :only => [:index, :show]
  resources :events, :except => [:index] do
    member do
      post 'add', :as => 'add'
      delete 'remove', :as => 'remove'
    end
  end
  match 'programme(/:day)' => 'events#index', :as => 'program'
  match 'photographers/edition/:edition' => 'photographers#index'
  
  resources :photographers
  resources :galleries
  
  match "press_accreditations", :to => "enquiries#index", :as => "press_accreditations"
  resources :enquiries, :only => [] do
    member do
      get 'legitimation'
    end
  end
  resources :photos, :only => [:show] do
    member do
      post 'add', :as => 'add'
      delete 'remove', :as => 'remove'
    end
  end
  
  match "slides/:id" => "pages#show", :as => 'slide'
  
  resources :users, :only => [] do
    collection do
      get 'welcome', :as => 'welcome'
    end
    member do
      get 'location', :as => 'edit_location'
      post  'clone' => 'photographers#clone'
    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :registrations, :only => [] do
    collection do
      post 'twitter', :as => 'twitter'
    end
  end
  
  resources :pages do
    member do 
      post  'clone' => 'galleries#clone'
    end
  end 

  resources :call_to_actions
  
  match "community", :to => "community#index"
  match "community/people", :to => "community#people"
  match "community/activity", :to => "community#activity"
  match "community/photos", :to => "community#photos"

  match "pages/view/list" => "pages#set_view", :view => 'list', :as => 'set_list_view'
  match "pages/view/block" => "pages#set_view", :view => 'block', :as => 'set_block_view'
  
  resources :collection_photos
  match "unseen-collection" => "collection_photos#index", :as => "unseen_collection"
  
  namespace :api do
    match 'events' => 'events#index'
    match ':version/events' => 'events#index'
    match 'galleries' => 'galleries#index'
    match ':version/galleries' => 'galleries#index'
    match 'photographers' => 'photographers#index'
    match ':version/photographers' => 'photographers#index'
    match ':version/pages' => 'pages#index'
    match 'authenticate' => 'sessions#api_authenticate', :as => 'authenticate'
    match 'api_redirect' => 'sessions#api_redirect', :as => 'redirect'
    
    resources :favourites, :only => [:index, :create,:destroy], :path => ':version/favourites'
    match ':version/favourites_sync' => 'favourites#sync'
  end

  # namespace :mobile do
  #   root :to => "simulator#index"
  #   resources :pages,   :only => [:show]
  #   resources :photos,  :only => [:show, :index]
  #   resources :events,  :only => [:show]
  #   match 'programme(/:day)' => 'events#index', :as => 'program'
  #   match "/collect", :to => "collect#index"
  #   match "/explore", :to => "collect#explore", :as => "explore"
  #   match "/fair", :to => "fair#index"
  #   match "/me", :to => "me#index"
  #   match "/more", :to => "more#index"
  #   match "/news", :to => "news#index"
  #   devise_scope :user do
  #     get "sessions/new", :to => "sessions#new", :as => 'new_session'
  #     post "sessions", :to => "sessions#create", :as => 'sessions'
  #   end
  # end

  resources :favourites, :only => [:destroy]
  post "favourites" => "favourites#create", :as => "create_favourite"

end
