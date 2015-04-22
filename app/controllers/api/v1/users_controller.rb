class Api::V1::UsersController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  before_action :require_user, except: :create
  respond_to :json

  # def index
  #     @user = user.all
  #   end

   def show
      render json: current_user
   end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: @user.to_json, status: 201, location: [:api, @user]
    else
      render json: {user: {errors: @user.errors}}.to_json, status: 422
    end
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      render json: @user, status: 200, location: [:api, @user]
    else
      render json: {user: { errors: @user.errors }}.to_json, status: 422
      end
    end


  # def destroy
  #   current_user.destroy
  #   head 204
  # end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

