Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
# resources :articles do
#   resources :comments, shallow: true
# end

# resources :articles do
#   resources :comments, only: [:index, :new, :create]
# end
# resources :comments, only: [:show, :edit, :update, :destroy]

concern :commentable do
  resources :comments
end
 
concern :image_attachable do
  resources :images #only: :index
end

resources :messages, concerns: [:image_attachable, :commentable]
end
