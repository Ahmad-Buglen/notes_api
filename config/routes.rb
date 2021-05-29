Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  get 'home', to: 'home#index'
  post 'report', to: 'home#report'
  root 'admin/dashboard#index' 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      post 'login', to: 'admin_users#login'
      resources :admin_users, only: [:create]
      resources :notes, only: [:create]
    end
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
