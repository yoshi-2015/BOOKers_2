Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :books
  resources :users
  resources :home, only: [:top, :show]
  resources :users, only: [:show, :edit]
  root to: 'home#top'
  get '/home/about' => 'home#show', as: :about
end