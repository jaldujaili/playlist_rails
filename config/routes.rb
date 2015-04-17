Rails.application.routes.draw do
  # devise_for :users
   namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    resources :playlist, :song, :artist, :album
  end
end
