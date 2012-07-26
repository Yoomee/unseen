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
  resources :photographers
  match "press_accreditations", :to => "enquiries#index", :as => "press_accreditations"
  resources :enquiries, :only => [] do
    member do
      get 'legitimation'
    end
  end
  
  match "pages/view/list" => "pages#set_view", :view => 'list', :as => 'set_list_view'
  match "pages/view/block" => "pages#set_view", :view => 'block', :as => 'set_block_view'
  
  namespace :mobile do
    root :to => "simulator#index"
    resources :pages,   :only => [:show]
    resources :photos,  :only => [:show, :index]
    resources :events,  :only => [:show]
    match 'programme(/:day)' => 'events#index', :as => 'program'
    match "/collect", :to => "collect#index"
    match "/explore", :to => "collect#explore", :as => "explore"
    match "/fair", :to => "fair#index"
    match "/me", :to => "me#index"
    match "/more", :to => "more#index"
    match "/news", :to => "news#index"
    devise_scope :user do
      get "sessions/new", :to => "sessions#new", :as => 'new_session'
      post "sessions", :to => "sessions#create", :as => 'sessions'
    end
  end
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
