Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home' => 'home#index'
  get '/home/search' => 'home#search'
  root to: 'home#index'
end
