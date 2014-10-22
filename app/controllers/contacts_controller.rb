class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to :back, :notice => 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Make sure you fill out each field or that your email address is valid!'
      render :new
    end
  end

  def thankyou
  end
end