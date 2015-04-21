class Api::V1::SongsController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  before_action :require_user, except: :create
  respond_to :json

     def index
        @song = Song.all
        render json: Song.all
      end

     def show
        render json: Song.find(params[:id])
      end

      def create
        @song = Song.new(params[:song])
        if @song.save
          render json: @song, status: 201, location: [:api, @song]
        else
          render json: {song: {errors: @song.errors}}.to_json, status: 422
      end

      def update
        @song = Song.find(params[:id])

        if @song.update(song_params)
          render json: @song, status: 200, location: [:api, @song]
      end

      def destroy
        @song = Song.find(params[:id])
        @song.destroy
        head 204
      end
        def song_params
          params.require(:song).permit(:title, :length, :genre)
      end
      end
      end
end
