class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :require_login, :authorize

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

    def authorize
      redirect_to '/login' unless current_user
    end

  def require_login
    unless current_user
      flash[:alert] = "Please login first"
      redirect_to root_path
    end
  end

end
