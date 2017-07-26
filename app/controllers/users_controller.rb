class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @current_user = @user
      session[:user_id] = @current_user.id
      redirect_to "/#{current_user.id}"
    else
      flash[:alert] = "Your information was invalid"
      redirect_to '/signup'
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
