class ContactsController < ApplicationController
  before_action :authorize

  def index
    @user = @current_user
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = @current_user.id
    if @contact.save
      redirect_to "/#{@current_user.id}"
    end
  end

  def show
    @user = @current_user
    @contact = Contact.find(params[:id])
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
