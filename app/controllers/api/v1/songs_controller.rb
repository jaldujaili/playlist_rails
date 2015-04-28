class Api::V1::SongsController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  before_action :require_user, except: :create
  respond_to :json

   def index
     puts "current_playlist= #{current_playlist}"
     render json: current_playlist.songs
   end

   def show
     render json: Song.find(params[:id])
   end
end
