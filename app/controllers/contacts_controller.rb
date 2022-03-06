class ContactsController < ApplicationController
  before_action :contact_params, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        format.html {redirect_to root_path, notice: 'Thank you for your message! I will get back to you shortly.'}
        format.json {render partial: "contacts/new"}
      else
        format.html {render partial: "contacts/new"}
        format.json {}
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname, :captcha)
  end
end
