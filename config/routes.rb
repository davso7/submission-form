# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                     forms GET    /forms(.:format)                                                                         forms#index
#                           POST   /forms(.:format)                                                                         forms#create
#                  new_form GET    /forms/new(.:format)                                                                     forms#new
#                 edit_form GET    /forms/:id/edit(.:format)                                                                forms#edit
#                      form GET    /forms/:id(.:format)                                                                     forms#show
#                           PATCH  /forms/:id(.:format)                                                                     forms#update
#                           PUT    /forms/:id(.:format)                                                                     forms#update
#                           DELETE /forms/:id(.:format)                                                                     forms#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :users
  resources :forms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
