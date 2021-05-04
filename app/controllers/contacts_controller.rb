class ContactsController < ApplicationController
	require 'mail_form'
	def new
		@contact = Contact.new
		@categories = Category.all
	end

	def create
		@contact = Contact.new(params[:contact])
		@categories = Category.all
		@contact.request = request
		if @contact.deliver
			flash.now[:notice] = 'Your message was sent successfully '
		else
			flash.now[:alert] = 'Cannot send message.'
			render :new
		end
	end
end

