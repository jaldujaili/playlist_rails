class Api::V1::SongsController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  before_action :require_user, except: :create
  respond_to :json

   def index
     render json: Song.all
   end

   def show
     render json: Song.find(params[:id])
   end
end
