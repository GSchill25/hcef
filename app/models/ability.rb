class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
        can :manage, :all
    elsif user.role? :instructor
        can :read, :all
        can :update, Program
        can :create, Child
        can :create, Guardian
        can :create, School
        can :create, AfterSchool
    end
  end
end
