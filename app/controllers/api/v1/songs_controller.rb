class Api::V1::SongsController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  before_action :require_user, except: :create
  respond_to :json

  def index
    render json: current_playlist.songs
   end

   def show
     render json: Song.find(params[:id])
   end

    private
    def current_playlist
      @current_playlist ||= current_user.playlists.find(params[:playlist_id])
      # @current_playlist ||Playlist.find_by(user_id: current_user.id, id: params[:playlist_id])
    end
end

