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
  resources :photos, :only => [:show] do
    member do
      post 'add', :as => 'add'
      delete 'remove', :as => 'remove'
    end
  end
  
  resources :users, :only => [] do
    member do
      get 'location', :as => 'edit_location'
    end
  end
  
  match "community", :to => "community#index"
  match "community/people", :to => "community#people"

  match "pages/view/list" => "pages#set_view", :view => 'list', :as => 'set_list_view'
  match "pages/view/block" => "pages#set_view", :view => 'block', :as => 'set_block_view'
  
end
