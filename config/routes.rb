Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :books
  root 'books#top'
  resources :users
  resources :home, only: [:index]
  resources :users, only: [:show, :edit]
end