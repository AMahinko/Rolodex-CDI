class SessionsController < ApplicationController
  before_action :check_signed_in

  def check_signed_in
    if current_user
      redirect_to "/#{@current_user.id}"
    end
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        session[:user_id] = user.id
        redirect_to '/#{user.id}'
        puts 'login green'

      else
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
        puts 'login red'
      end
  end

    def destroy
      session[:user_id] = nil
      redirect_to '/login'
    end
end
