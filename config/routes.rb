Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'

  resources :articles
  resources :content_pages, only: [:show], path: ''
  resources :news, controller: 'news_items'
  resources :user_requests, only: [:create]

  post 'manual_select_office' => 'application#manual_select_office'
end
