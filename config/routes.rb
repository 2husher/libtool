# == Route Map
#
#      Prefix Verb   URI Pattern                 Controller#Action
# search_find GET    /search/find(.:format)      search#find
#       books GET    /books(.:format)            books#index
#             POST   /books(.:format)            books#create
#    new_book GET    /books/new(.:format)        books#new
#   edit_book GET    /books/:id/edit(.:format)   books#edit
#        book GET    /books/:id(.:format)        books#show
#             PATCH  /books/:id(.:format)        books#update
#             PUT    /books/:id(.:format)        books#update
#             DELETE /books/:id(.:format)        books#destroy
#     readers GET    /readers(.:format)          readers#index
#             POST   /readers(.:format)          readers#create
#  new_reader GET    /readers/new(.:format)      readers#new
# edit_reader GET    /readers/:id/edit(.:format) readers#edit
#      reader GET    /readers/:id(.:format)      readers#show
#             PATCH  /readers/:id(.:format)      readers#update
#             PUT    /readers/:id(.:format)      readers#update
#             DELETE /readers/:id(.:format)      readers#destroy
#

Libtool::Application.routes.draw do

  get "search/find"

  get "books/:id/return" => "books#return", as: :return

  get 'books/:id/continue' => "books#continue", as: :continue

  resources :books
  
  resources :readers

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
