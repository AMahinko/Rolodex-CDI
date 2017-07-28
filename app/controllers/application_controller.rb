class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :require_login

  def current_user
    if session[:user_id] && User.exists?(session[:user_id])
      User.find(session[:user_id])
    end
  end

  def require_login
    unless current_user
      flash[:alert] = "Please login first"
      redirect_to root_path
    end
  end

end
