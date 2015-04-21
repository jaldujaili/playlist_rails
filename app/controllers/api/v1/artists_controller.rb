class Api::V1::ArtistController < ApplicationController
  before_filter :authorize, only: [:destroy, :update]
      def index
        @artist = Artist.all
      end

       def show
        render json: Artist.find(params[:id])
      end

      def create
        @artist = Artist.new(params[:artist])
        if @artist.save
          render json: @artist, status: 201, location: [:api, @artist]
        else
          render json: { artist: {errors: @artist.errors}}.to_json, status: 422
      end

      def update
        @artist = Artist.find(params[:id])

        if @artist.update(artist_params)
          render json: @artist, status: 200, location: [:api, @artist]
      end

      def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        head 204
      end
        def artist_params
          params.require(:artist).permit(:name)
      end
      end
      end
end
