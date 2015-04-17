require 'api_constraints'
Rails.application.routes.draw do
  # devise_for :users
     namespace :api, defaults: { format: :json }, path: '/' do

      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      resources :playlist, :song, :artist, :album, :user
    end
  end
end
