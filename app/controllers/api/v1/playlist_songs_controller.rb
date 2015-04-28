class Api::V1::PlaylistSongsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :require_user
  respond_to :json
  # GET /playlist_songs
  # GET /playlist_songs.json
  def index
  @playlist_song = current_playlist.playlist_songs
    render json: @playlist_song
  end

  # GET /playlist_songs/1
  # GET /playlist_songs/1.json
  def show
    render json: PlaylistSong.find(params[:id])
  end

  # POST /playlist_songs
  # POST /playlist_songs.json
  def create
    @playlist_song = PlaylistSong.new(playlist_song_params)

    if @playlist_song.save
      render json: @playlist_song, status: :created, location: @playlist_song
    else
      render json: @playlist_song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlist_songs/1
  # PATCH/PUT /playlist_songs/1.json
  def update
    @playlist_song = PlaylistSong.find(params[:id])

    if @playlist_song.update(playlist_song_params)
      head :no_content
    else
      render json: @playlist_song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlist_songs/1
  # DELETE /playlist_songs/1.json
  def destroy
    @playlist_song.destroy

    head :no_content
  end

  private

    def set_playlist_song
      @playlist_song = PlaylistSong.find(params[:id])
    end

    def playlist_song_params
      params[:playlist_song].permit!
    end
end
