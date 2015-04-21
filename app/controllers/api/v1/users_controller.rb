class Api::V1::UsersController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  before_action :require_user, except: :create
  respond_to :json
  # def index
  #     @user = user.all
  #   end

  #  def show
  #     @user = user.find(params[:id])
  #   end

  def new
    @user = User.new
  end

  def create
    @user = user.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      render json: @user, status: 201, location: [:api, @user]
    else
      render json: {user: {errors: @user.errors}}.to_json, status: 422
    end

    def update
      @user = user.find(params[:id])

      if @user.update_attribute(user_params)
        render json: @user, status: 200, location: [:api, @user]
      end

      def destroy
        @user = user.find(params[:id])
        @user.destroy
        head 204
      end
      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
    end
  end
end

