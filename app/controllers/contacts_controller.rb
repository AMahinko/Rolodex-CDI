class ContactsController < ApplicationController
  before_action :authorize

  def index
    @contacts = Contact.all
  end

  def show
    @user = @current_user
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to '/'
  end


end
