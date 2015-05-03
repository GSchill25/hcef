class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :instructor
        #Instructors should only be allowed to view information about the location
        #that they are assigned to, as well as all programs/children that belongs to
        #the location, but nothing else.

        #afterschool
        can :manage, AfterSchool do |afterschool|
            user_afterschools = user.instructor.locations.map{|c| c.programs.map{|d| d.after_schools.map(&:id)}.flatten}.flatten
            user_afterschools.include? afterschool.id
        end

        #child
        can :create, Child
        can :manage, Child do |child|
            user_child = user.instructor.locations.map{|c| c.children.map(&:id)}.flatten
            user_child.include? child.id
        end
        
        #enrichment
        can :manage, Enrichment do |enrichment|
            user_enrichments = user.instructor.locations.map{|c| c.programs.map{|d| d.after_schools.map(&:id)}.flatten}.flatten
            user_enrichments.include? afterschool.id
        end
        
        #field_trip
        can :manage, FieldTrip do |field_trip|
            user_field_trips = user.instructor.locations.map{|c| c.programs.map{|d| d.field_trips.map(&:id)}.flatten}.flatten
            user_field_trips.include? field_trip.id
        end
        
        #guardian
        can :create, Guardian
        can :manage, Guardian do |guardian|
            user_location = user.instructor.locations.map{|c| c.guardians.map(&:id)}.flatten
            user_location.include? guardian.id
        end
        
        #instructor
        can :read, Instructor do |instructor|
            user_location = user.instructor.locations.map(&:id)
            instructor_location = instructor.locations.map(&:id)
            (user_location & instructor_location).any?            
        end

        can :update, Instructor do |instructor|
            instructor.id == user.instructor_id
        end

        #location
        can :read, Location do |location|
            user_location = user.instructor.locations.map(&:id)
            user_location.include? location.id
        end
        #sub_location
        can :read, SubLocation do |sub_location|
            user_sub_location = user.instructor.locations.map{|c| c.sub_locations.map(&:id)}.flatten
            user_sub_location.include? sub_location.id
        end

        #program
        can :read, Program do |program|
            user_programs = user.instructor.locations.map{|c| c.programs.map(&:id)}.flatten
            user_programs.include? program.id
        end

        #provider
        can :read, Provider
        
        #school
        can :manage, School

        #user
        can :update, User do |current_user|
            current_user.id == user.id
        end
    #elsif user.role? :guardian
    #    can :manage, Child do |child|
    #        child.guardian.id == user.guardian_id
    #    end
    end
  end
end