class SessionsController < ApplicationController
  before_action :check_signed_in
  skip_before_action :check_signed_in, only: [:destroy]

  def check_signed_in
    if current_user
      #### CHECK TO SEE IF THIS ISN'T HACKY
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
        # flash[:alert] = "Success!"
        redirect_to "/#{user.id}"

      else
      # If user's login doesn't work, send them back to the login form.
        flash[:alert] = "Invalid authentication"
        redirect_to '/login'
      end
  end

    def destroy
      session[:user_id] = nil
      @current_user = nil
      redirect_to '/login'
    end
end
