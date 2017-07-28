class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      current_user = @user
      session[:user_id] = current_user.id
      redirect_to "/#{current_user.id}"
    else
      redirect_to '/signup'
    end
  end

  def destroy
    # if session[:id] == params[:id]
    #   @user.delete
      current_user.destroy
      session[:user_id] = nil
      flash[:alert] = 'Account deleted!'
      redirect_to '/'
    # end


  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
