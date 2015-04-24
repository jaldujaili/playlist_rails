class Api::V1::ArtistsController < ApplicationController
  before_filter :authorize, only: [:destroy, :update]
      def index
        render json: Artist.all
      end

       def show
        render json: Artist.find(params[:id])
      end
end
