class Api::V1::AlbumsController < ApplicationController
  before_filter :authorize, only: [:destroy, :update]
  respond_to :json

      def index
        @album = Album.all
      end

      def show
        render json: Album.find(params[:id])
      end

      def create
        @album = Album.new(params[:album])
        if @album.save
          render json: @album, status: 201, location: [:api, @album]
        else
          render json: { album: {errors: @album.errors}}.to_json, status: 422
      end

      def update
        @album = Album.find(params[:id])

        if @album.update(album_params)
          render json: @album, status: 200, location: [:api, @album]
      end

      def destroy
        @album = Album.find(params[:id])
        @album.destroy
        head 204
      end
          private
        def album_params
          params.require(:album).permit(:title)
        end
      end
      end
end


