class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # private
  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     @user = User.where(api_key: token).first
  #   end
#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   end
#   helper_method :current_user
#
#   def authorize
#     if @current_user.blank?
#       render json: {error: {message: "Failed to authenticate user"}}, status: 401
#     end
#   end
end
