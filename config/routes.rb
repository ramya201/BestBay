BestBay::Application.routes.draw do

  devise_for :users

  get "seller/index"

  get "seller/show"

  get "dashboard/index"

  get "dashboard/show"

  get "welcome/index"

  root :to => 'welcome#index'

  resources :items

  resources :cart do
    member do
      get 'add'
      get 'get'
      get 'index'
      get 'remove'
    end
  end

  resources :items do
    member do
      get 'catalogue'
    end
  end

  match "items/catalogue/subcategory_id=:subcategory_id/category_id=:category_id" => "items#catalogue"


  get "items/index"

  get "items/show"

  get "items/new"

  get "items/edit"

  get "items/destroy"

  get "subcategories/list"

  get "subcategories/show"



  get "categories/index"

  resources :categories do
    member do
      get 'seller_index'
    end
  end

  resources :subcategories do
    member do
      get 'view_subcategory'
    end
  end



  resources :categories do
    resources :subcategories do
      resources :items
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
  # match ':controller(/:action(/:id))(.:format)'
end
