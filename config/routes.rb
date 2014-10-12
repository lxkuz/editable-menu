Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'

  resources :articles
  resources :content_pages, only: [:show], path: ''
  resources :news, controller: 'news_items'

  resources :menu_items, only: [:index, :create, :destroy, :update] do
    collection do
      get 'search'
    end
  end

  get 'about' => 'home#about'

  resources :user_requests, only: [:create]

  post 'manual_select_office' => 'application#manual_select_office'
end
