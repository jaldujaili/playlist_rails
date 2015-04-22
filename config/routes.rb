require 'api_constraints'
Rails.application.routes.draw do


     namespace :api, defaults: { format: :json }, path: '/' do

      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        resources :sessions, :only => [:create, :destroy]
        resources :users, only: [:show, :create, :update, :destroy] do
          resources :playlists do
            resources :songs, :artists, :albums
        end
      end
    end
  end
end
