class Api::V1::ArtistsController < ApplicationController
  before_filter :authorize, only: [:destroy, :update]
  before_action :require_user, except: :create
  respond_to :json

      def index
        render json: { artists: current_playlist.artists}.to_json
      end

       def show
        render json: Artist.find(params[:id])
       end

  private
  def current_playlist
    @current_playlist ||= current_user.playlists.find(params[:playlist_id])
  end
end

