Catreen101::Application.routes.draw do
  
  root :to => 'welcome#index'
  get "calender/full_calender"
  get 'calender/calender'
  post 'citems/add' => 'citems#add'
  get 'citems/remove', :as=>'removefromcart'
  get 'citems/removeall', :as=>'cancelorder'
  get 'citems/list', :as=>'listorder'
  get 'citems/show', :as=>'showitemsincart'
  get 'ibooks/confirm', :as=>'confirm'
  get 'menus/show', :as=>'showmenus'
  get 'pages/login', :as => "login"
  get "logout" => "pages#destroy", :as => "logout"
  get 'users/list_users', :as => 'listUser'
  get 'galleries/gallery'
  #get 'welcome/profile', :as => "profile"
  #get 'welcome/index'
  #get 'inquiries/new', :as => 'inquiry'
  #get "logout" => "sessions#destroy", :as => "logout"
  #get "login" => "sessions#new", :as => "login"
  #get "sign_up" => "users#new", :as => "sign_up"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  resources :users
  resources :pages
  resources :inquiries, :only => [:new, :create]
  resources :welcome
  resources :menus
  resources :carts
  resources :ibooks
  resources :hcontents
  resources :slides
  #resources :citems
  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
