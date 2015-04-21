class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # private
  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     @user = User.where(api_key: token).first
  #   end

  def auth_token
    puts request.headers["HTTP_AUTHORIZATION"].inspect
    return nil if request.headers["HTTP_AUTHORIZATION"].blank?
    request.headers["HTTP_AUTHORIZATION"].gsub("Token token=\"", "").gsub("\"", "")
  end
  def require_api_auth
    auth_token == "tr34tm4t3"
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    # return if Rails.env.development?
    @current_user = User.token_authenticate!(auth_token)
    if @current_user.blank?
      render json: {error: {message: "Failed to authenticate user"}}, status: 401
    end
    true
  end
#   helper_method :current_user
#
#   def authorize
#     if @current_user.blank?
#       render json: {error: {message: "Failed to authenticate user"}}, status: 401
#     end
#   end
end
