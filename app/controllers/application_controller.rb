class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(email: cookies[:email])
  end
end
