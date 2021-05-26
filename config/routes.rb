Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      post 'sign_in', to: 'admin_users#sign_in'
      resources :admin_users, only: [:create]
    end
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
