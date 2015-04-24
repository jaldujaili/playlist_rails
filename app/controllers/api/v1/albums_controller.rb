class Api::V1::AlbumsController < ApplicationController
  before_filter :authorize, only: [:destroy, :update]
  respond_to :json

  def index
    render json: Album.all
  end
  def show
    render json: Album.find(params[:id])
  end
end


