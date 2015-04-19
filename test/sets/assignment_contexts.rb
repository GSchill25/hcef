module Contexts
  module AssignmentContexts
  	def create_after_schools
      # assumes create_curriculums prior
      @CMU_assignment = FactoryGirl.create(:assignment, instructor: @instructor1, location: @CMU)
      @UPitt_assignment = FactoryGirl.create(:assignment, instructor: @instructor3, location: @UPitt)
    end

    def delete_after_schools
      @CMU_assignment.delete
      @UPitt_assignment.delete
    end
  end
end