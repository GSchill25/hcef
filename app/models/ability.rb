class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :instructor
        #afterschool
        #this next line of code does not work; figure out why
        can :create, AfterSchool
        can :manage, AfterSchool

       # can :manage, AfterSchool do |afterschool|
       #     afterschool_instructors = user.instructor.programs.map{|c| c.after_schools.map(&:id)}
       #     afterschool_instructors.include? after_school.id
       #     locations_instructors = user.instructor.locations.map{|c| c.programs }
       #     for locations_instructors do |afterschool|
       #     end                
       # end
        
        #can :read, After_school
        #can :update, After_school do |afterschool|
            #afterschool_ins = afterschool.program.instructors.map(&:id)
        #end

        #assignment
        
        #child
        can :create, Child
        can :manage, Child do |child|
        end
        #keep in mind this may change
        
        #enrichment
        can :create, Enrichment
        can :manage, Enrichment do |enrichment|
        end
        
        #enrollment
        
        #field_trip
        can :create, FieldTrip
        can :manage, FieldTrip do |field_trip|
        end
        
        #guardian
        can :manage, Guardian do |guardian|
        end
        #make sure instructors can only see guardians linked to the child
        #DO THIS
        
        #instructor
        can :read, Instructor
        can :update, Instructor do |instructor|
            instructor.id == user.instructor_id
        end

        #location
        can :read, Location do |location|
            instructor_location = user.instructor.locations.map(&:id)
            instructor_location.include? location.id
        end

        #can :create, Location
        #can :manage, Location do |location|
        #    program_instructors = user.instructor.programs.map{|c| c.location.id}
        #    program_instructors.include? location.id
        #end

        #sub_location

        #program
        can :read, Program do |program|
            location_instructors = user.instructor.locations.map(&:id)
            program_location = program.location.id
            location_instructors.include? program.location.id
        end

        #provider
        can :read, Provider
        
        #school
        can :manage, School
        
        #user
        can :update, User do |current_user|
            current_user.id == user.id
        end
    elsif
        can :manage, :all
    #elsif user.role? :guardian
    #    can :manage, Child do |child|
    #        child.guardian.id == user.guardian_id
    #    end
    end
  end
end