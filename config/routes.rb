Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :dashboard do
    get '/' => 'home#index'
    resources :txns, only: %i[new create show]
    resources :claims, only: %i[new create show]
    resource :user
  end

  namespace :api do
    namespace :v1 do
      resources :txns, only: %i[update]
      resources :bridge do
        collection do
          post :receive
          post :error
        end
      end
    end
  end

  root "home#index"

end
