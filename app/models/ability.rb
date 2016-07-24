class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
    	can :manage, :all
    else
    	can :read, :products
    	can[:read, :upadte], User, id: user.id
    	can :update, :comments
    end
  end 
end