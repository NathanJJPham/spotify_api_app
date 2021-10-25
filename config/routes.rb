Rails.application.routes.draw do
  # get 'artists/index'
  # get 'artists/show'
  # get 'artists/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
get '/artists/:id', to: 'artists#show', as: 'artist'
get '/search', to: 'artists#search'
end
