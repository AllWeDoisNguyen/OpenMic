Rails.application.routes.draw do
  resources :shows
  root 'application#homepage'

  get '/sessions/new_user/' => 'sessions#new_user', as: :new_user_session
  get '/sessions/new_comedian/' => 'sessions#new_comedian', as: :new_comedian_session
  post '/sessions/create_comedian/' => 'sessions#create_comedian', as: :create_comedian_session
  post '/sessions/create_user/' => 'sessions#create_user', as: :create_user_session
  get '/sessions/logout' => 'sessions#destroy', as: :log_out
  get '/bookings/add_comedian' => 'bookings#create', as: :create_booking


  resources :users 
  resources :comedians do
    resources :reviews
  end
  resources :sessions
  resources :bookings



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
