class UserRegistrationsController < Devise::RegistrationsController
  #registering user
  def create
  	super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end
end
