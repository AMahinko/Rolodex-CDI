class ContactsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    user = current_user
    @contact.user_id = user.id
    if @contact.save
      redirect_to "/#{user.id}"
    end
  end

  def show
    @user = current_user
    @contact = Contact.find(params[:id])
    if @user.id == @contact.user_id
      render "show.html.erb"
    else
      redirect_to root_path
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to '/'
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    redirect_to contacts_path
  end

private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :note, :email, :phone)
  end

end
