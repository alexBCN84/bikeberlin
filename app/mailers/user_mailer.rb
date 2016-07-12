class UserMailer < ApplicationMailer
  default from: "alejandro.ginesmartinez@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'alejandro.ginesmartinez@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end

# app/mailers/user_mailer.rb
class UserMailer < ActionMailer::Base
  default from: "alejandro.ginesmartinez@gmail.com"

  def password_changed(id)
    @user = User.find(id)
    mail to: @user.email, subject: "Your password has changed"
  end
end