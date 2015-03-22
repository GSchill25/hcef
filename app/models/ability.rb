class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :instructor
        #afterschool
        #can :read, After_school
        #can :update, After_school do |afterschool|
            #afterschool_ins = afterschool.program.instructors.map(&:id)
        #end
        #assignment
        #child
        can :manage, Child
        #enrichment
        #enrollment
        #field_trip
        #guardian
        #instructor
        can :update, Instructor do |instructor|
            instructor.id == user.instructor_id
        end
        can :read, Program
        #location
        #program
        #provider
        #school
        #user
    end
  end
end
