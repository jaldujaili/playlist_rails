class PlaylistsController < ApplicationController

      def index
        @playlist = Playlist.all
      end

     def show
        render json: Playlist.find(params[:id])
      end

      def create
        @playlist = Playlist.new(params[:playlist])
        if @playlist.save
          render json: @playlist, status: 201, location: [:api, @playlist]
        else
          render json {playlist: {errors: @playlist.erros}}.to_json, status 422
      end

      def update
        @playlist = Playlist.find(params[:id])

        if @playlist.update_attribute(playlist_params)
          render json: @playlist, status: 200, location: [:api, @playlist]
      end

      def destroy
        @playlist = Playlist.find(params[:id])
        @playlist.destroy
        head 204
      end
        def playlist_params
          params.require(:playlist).permit(:title)
      end
    end