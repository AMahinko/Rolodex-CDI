class ContactsController < ApplicationController
  before_action :authorize

  def index
    @contacts = Contact.all
  end

  def show
    @user = @current_user
    @contact = Contact.find(params[:id])
  end


end
