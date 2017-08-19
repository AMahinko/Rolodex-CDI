class SessionsController < ApplicationController
  before_action :check_signed_in, only: :new


  def check_signed_in
    if current_user
      redirect_to "/#{current_user.id}"
    end
  end


  def new
  end

  def create
    user = User.find_by_email(params[:email])

      if env["omniauth.auth"]
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id]=user.id
        redirect_to "/#{user.id}"

      elsif user && user.authenticate(params[:password])
        session[:user_id] = user.id
        # flash[:alert] = "Success!"
        redirect_to "/#{user.id}"

      else
        flash[:alert] = "Invalid authentication"
        redirect_to '/login'
      end
  end

    def destroy
      if current_user
        session[:user_id] = nil
        redirect_to '/login'
      end
    end
end
