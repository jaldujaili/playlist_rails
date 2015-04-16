Rails.application.routes.draw do
  namespace :user do
    resources :playlist, :song, :artist, :album
  end
end
