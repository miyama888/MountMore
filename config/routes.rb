Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  get 'home/about', to: 'articles#about'
  get "search" => "searches#search"
  resources :users, only: [:index, :show, :edit, :update, :destroy, :create ]
  resources :articles, only: [:show, :edit, :update, :new, :destroy, :create, :index] do
  	resources :article_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  	collection do
  		get 'select_prefecture'
  	end
  end
end
