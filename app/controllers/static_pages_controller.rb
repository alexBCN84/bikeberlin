class StaticPagesController < ApplicationController
  def index
  end

  #thank you page after sending contact form
  def thank_you   
  @name = params[:name]   
  @email = params[:email]   
  @message = params[:message]   
  ActionMailer::Base.mail(:from => @email,       
    :to => 'alejandro.ginesmartinez@gmail.com',       
    :subject => "A new contact form message from #{@name}",       
    :body => @message).deliver_now 
  end

end
