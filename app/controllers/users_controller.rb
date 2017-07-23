class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      puts "SAVED"
      redirect_to '/show'
    else
      redirect_to '/signup'
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end
