Ndconfessions::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :confessions do
    member do
       post :vote_up
       post :vote_down
    end
    collection do
      get :popular_recently
      get :popular_today
      get :popular_this_week
      get :popular_all_time
    end
  end


  match '/about', to: 'static_pages#about'
  match '/home', to: 'confessions#popular_today'
  match '/help', to: 'static_pages#help'
  match '/creators', to: 'static_pages#creators'
  match '/work_with_us', to: 'static_pages#work_with_us'
  match '/most_recent', to: 'confessions#index'

 
  match '/signup', to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/submit', to: 'confessions#new'
  match '/post', to: 'confessions#create'

  # if current_user.signed_in?
  #   root to: 'confessions#index'
  # else
    root to: 'confessions#popular_today'
  


  

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
