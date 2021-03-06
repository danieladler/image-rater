Rails.application.routes.draw do
  root to: "photos#index"

  get  "/sign-up"                , to: "users#sign_up", as: :sign_up
  post "/users/:user_id"         , to: "users#update" , as: :update_user
  post "/users"                  , to: "users#create" , as: :new_user
  get  "/users/:user_id"         , to: "users#show"   , as: :user

  # put mailer routes here if they are to occur separately from
  # existing actions (like creating a new user)

  post "/sign-in"                , to: "sessions#sign_in" , as: :sign_in
  get  "/sign-out"               , to: "sessions#sign_out", as: :sign_out

  get    "/"                     , to: "photos#index"
  get    "/photos/new"           , to: "photos#new"    , as: :new_photo
  get    "/photos/ranked"        , to: "photos#ranked" , as: :ranked
  get    "/photos/:photo_id"     , to: "photos#show"   , as: :photo
  post   "/photos"               , to: "photos#add"    , as: :add_photo
  patch  "/photos/:photo_id"     , to: "photos#update" , as: :update_photo
  delete "/photos/:photo_id"     , to: "photos#delete" , as: :delete_photo

  # ratings routes to go here
  post "/photos/:photo_id/rate"  , to: "ratings#create"   , as: :rating


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
