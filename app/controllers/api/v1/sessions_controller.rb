class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: 200, location: [:api, user]
    else
      render json: {session: {errors: "Invalid email or password" }}.to_json, status: 422
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
