class Api::V1::PlaylistsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :require_user
  respond_to :json

  def index
    render json: current_user.playlists
  end

 def show
   render json: Playlist.find(params[:id])
 end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      render json: @playlist.to_json, status: 201
    else
      render json: {playlist: {errors: @playlist.errors}}.to_json, status: 422
    end
  end

  def update
    @playlist = Playlist.find(params[:id])

    if @playlist.update(playlist_params)
      render json: @playlist, status: 200
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    head 204
  end
  def playlist_params
    params.require(:playlist).permit!
  end
  end