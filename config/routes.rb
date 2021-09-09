Rails.application.routes.draw do
  resources :comments
  resources :maps
  get 'maps/comment/:map_id', to: 'comments#map_comment'

end
