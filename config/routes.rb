Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end
  devise_for :users
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :users, only: [:index, :create, :update, :show, :destroy]

      resources :properties, only: [:index]
    end
  end
end
