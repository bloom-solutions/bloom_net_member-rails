Rails.application.routes.draw do

  namespace :dashboard do
    resources :txns, only: %i[new create show]
  end

  namespace :api do
    namespace :v1 do
      resources :txns, only: %i[update]
    end
  end

end
