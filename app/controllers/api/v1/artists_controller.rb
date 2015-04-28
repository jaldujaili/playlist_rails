class Api::V1::ArtistsController < ApplicationController
  before_filter :authorize, only: [:destroy, :update]
      def index
        @artist = current_playlist.artists
        render json: current_playlist.artists
      end

       def show
        render json: Artist.find(params[:id])
      end
end
