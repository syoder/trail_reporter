Rails.application.routes.draw do
  resources :tags
  resources :comments
  resources :trails
  resources :categories
  resources :reports

  devise_for :users

  root 'home#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :reports, only: [:index]
    end
  end

end
