class Contact < MailForm::Base
	include MailForm::Delivery

	attributes :name, :email, :message, :form

	def headers
		{
			:to => "yvesmahirwe1@gmail.com",
			:subject => "Contact form",
			:from => %("#{name}" <#{email}>)
		}
	end

	validates :name, :message, presence: true
end