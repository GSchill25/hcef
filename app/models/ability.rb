class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :instructor
        #afterschool
        #this next line of code does not work; figure out why
        can :create, AfterSchool
        can :read, AfterSchool do |afterschool|
            afterschool_instructors = user.instructor.programs.map{|c| c.after_schools.map(&:id)}
            afterschool_instructors.include? afterschool.id
        end
        #can :read, After_school
        #can :update, After_school do |afterschool|
            #afterschool_ins = afterschool.program.instructors.map(&:id)
        #end

        #assignment
        
        #child
        can :manage, Child do |child|
            child_instructors = user.instructor.programs.map{|c| c.children.map(&:id)}
            child_instructors.include? child.id
        end
        #keep in mind this may change
        can :create, Child
        
        #enrichment
        
        #enrollment
        
        #field_trip
        
        #guardian
        #make sure instructors can only see guardians linked to the child
        
        #instructor
        can :read, Instructor
        can :update, Instructor do |instructor|
            instructor.id == user.instructor_id
        end

        #location
        can :manage, Location

        #program
        can :read, Program do |program|
            program_instructors = user.instructor.programs.map(&:id)
            program_instructors.include? program.id
        end

        #provider
        
        #school
        
        #user
    
    #elsif user.role? :guardian
    #    can :manage, Child do |child|
    #        child.guardian.id == user.guardian_id
    #    end
    end
  end
end
