RapaNui::Application.routes.draw do
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  match 'servers/:id/ping' => 'servers#ping'
  match 'servers/:id/disks' => 'servers#disks', :as => "servers_disks"
  match 'servers/telnet/:id/:p' => 'servers#telnet', :as => "servers_telnet"
  match 'servers/command/:id/:cmd' => 'servers#command', :as => "servers_command"


  #map.telnet 'servers/telnet/:id/:port', :controller => 'servers', :action => 'telnet'

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
  root :to => "server_racks#index"

  resources :servers do
    collection do
      get :search, :telnet
    end
  end
   
  resources :accounts do
    collection do
      get :login, :logout
      post :doLogin
    end
  end
   
  resources :types

  resources :operational_systems

  resources :os

  resources :server_racks

  resources :servers
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
