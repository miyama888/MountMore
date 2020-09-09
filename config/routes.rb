Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  get 'home/about', to: 'articles#about'
  resources :users, only: [:index, :show, :edit, :update, :destroy, :create ]
  resources :articles, only: [:show, :edit, :update, :destroy, :create]
end
