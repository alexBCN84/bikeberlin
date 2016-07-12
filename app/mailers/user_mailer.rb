class UserMailer < ApplicationMailer
  default from: "alejandro.ginesmartinez@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'alejandro.ginesmartinez@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end