class ContactsController < ApplicationController
  before_action :contact_params, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    
    if @contact.deliver
      respond_to do |format|
        format.html {redirect_to root_path, notice: 'Thank you for your message! I will get back to you shortly.'}
      end
    else
      respond_to do |format|
        format.html {flash.now[:alert] = 'Your message could not be sent. Please try again.'}
        format.js {}
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname, :captcha)
  end
end
