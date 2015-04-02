Rails.application.routes.draw do
  
  root 'users#login'

  get 'login', to: "users#login", as: 'login'

  get 'signup', to: "users#signup", as: 'signup'

  post 'login', to: "users#attempt_login"

  post 'signup', to: "users#create"

  get 'home', to: "users#home", as: 'home'

  delete 'logout', to: "users#logout", as: "logout"

  get 'acts', to: "acts#index", as: "acts"

  get 'acts/:category', to:'acts#index', as: "acts_by_category"

  get 'acts/show'

  get '/comments/:category', to: 'comments#category', as: "comment_category"
  
  resources :comments, only: [:create, :destroy]
 
  get 'users/login'

  get 'users/signup'


# rake routes:       Prefix Verb   URI Pattern                  Controller#Action
#                root GET    /                            users#login
#               login GET    /login(.:format)             users#login
#              signup GET    /signup(.:format)            users#signup
#                     POST   /login(.:format)             users#attempt_login
#                     POST   /signup(.:format)            users#create
#                home GET    /home(.:format)              users#home
#              logout DELETE /logout(.:format)            users#logout
#          acts_index GET    /acts/index(.:format)        acts#index
#   comments_kindness GET    /comments/kindness(.:format) comments#kindness
#       comments_fear GET    /comments/fear(.:format)     comments#fear
#   comments_yourself GET    /comments/yourself(.:format) comments#yourself
#         users_login GET    /users/login(.:format)       users#login
#        users_signup GET    /users/signup(.:format)      users#signup


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
