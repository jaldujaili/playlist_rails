class Api::V1::AlbumsController < ApplicationController
  before_filter :authorize, only: [:destroy, :update]
  before_action :require_user, except: :create
  respond_to :json

  def index

    render json: current_playlist.albums
  end
  def show
    render json: Album.find(params[:id])
  end
  def current_playlist
    @current_playlist ||= current_user.playlists.find(params[:playlist_id])
  end
end
//yep
//no
