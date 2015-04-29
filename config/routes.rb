require 'api_constraints'
Rails.application.routes.draw do


     namespace :api, defaults: { format: :json }, path: '/' do

      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        resources :sessions, :only => [:create, :destroy]
        resources :users, only: [:show, :create, :update, :destroy]

        resources :playlists do
            resources :artists, :albums, :only => [:show, :index]
            resources :songs, :only =>[:show, :index]
        end
        resources :songs do
          resources :playlists, :only => [:show,:index]
          end
          resources :playlist_songs, :only => [:show,:index]
      end
    end
  end