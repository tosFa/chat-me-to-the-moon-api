require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users, :except => [:show, :create, :update, :destroy],
    :controllers => { :confirmations => "api/v1/confirmations" }

  namespace :api, defaults: { format: :json } do
    # We are going to list our resources here

    scope module: :v1,
      constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here

      resources :users, :only => [:show, :create, :update, :destroy]
      resources :organizations, :only => [:show, :create, :update, :destroy, :index]
      resources :teams, :only => [:show, :create, :update, :destroy, :index]
      get 'me', to: 'users#me'
      resources :sessions, :only => [:create]
      delete 'sessions', to: 'sessions#destroy'
      resources :products, :only => [:show, :index]
    end
  end
end
