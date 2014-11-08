Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'

  resources :articles
  get 'about' => 'home#about'
  resources :news, controller: 'news_items'

  resources :promo_slides, only: [:index, :create, :destroy, :update]
  resources :menu_items, only: [:index, :create, :destroy, :update] do
    collection do
      get 'search'
    end
  end


  resources :user_requests, only: [:create]
  post 'manual_select_office' => 'application#manual_select_office'
  resources :content_pages, only: [:show], path: ''
end
