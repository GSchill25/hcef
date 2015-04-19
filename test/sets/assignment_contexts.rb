module Contexts
  module AssignmentContexts
  	def create_after_schools
      # assumes create_curriculums prior
      @CMU_assignment = FactoryGirl.create(:assignment, )
      @UPitt_assignment
    end

    def delete_after_schools
      @as1.delete
      @as2.delete
    end
  end
end