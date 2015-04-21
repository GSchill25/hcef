module Contexts
  module AssignmentContexts
  	def create_assignments
      # assumes create_curriculums prior
      @CMU_assignment1 = FactoryGirl.create(:assignment, instructor: @instructor1, location: @CMU)
      @CMU_assignment2 = FactoryGirl.create(:assignment, instructor: @instructor2, location: @CMU)
      @CMU_assignment3 = FactoryGirl.create(:assignment, instructor: @instructor4, location: @CMU)
      @UPitt_assignment1 = FactoryGirl.create(:assignment, instructor: @instructor3, location: @UPitt)
    
    end

    def delete_aassignments
      @CMU_assignment1.delete
      @CMU_assignment2.delete
      @CMU_assignment3.delete
      @UPitt_assignment1.delete
    end
  end
end