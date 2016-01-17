Rails.application.routes.draw do
  devise_for :user, :path => '', :path_names => { :sign_in => "signin",
                                                  :sign_out => "signout",
                                                  :sign_up => "signup" },
             :controllers => { :registrations => 'registrations'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'generals#homepage'

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

  namespace :v1, path: '1.0', defaults: {format: 'json'} do
    # Autorization and registration
    devise_scope :user do
      post 'users/login' => 'sessions#create', :as => 'login'
      get 'users/self/profile' => 'sessions#show', :as => 'accout'
      post 'users/signup' => 'registrations#create', :as => 'signup'
      post 'users/update_profile' => 'registrations#update_profile', :as => 'update'
    end
  end
end
