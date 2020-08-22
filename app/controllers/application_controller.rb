class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    if session[:auth_token].present?
      user_info = JsonWebToken.decode(session[:auth_token])
      if user_info.present?
        @current_user = User.find(user_info[:user_id])
      end
    end
    @current_user ||= User.find_by(email: cookies[:email], password_digest: cookies[:password]) || User.find_by(id: session[:user_id])
  end
end