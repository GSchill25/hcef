module Contexts
  module AfterSchoolContexts
  	def create_after_schools
      # assumes create_curriculums prior
      @as1 = FactoryGirl.create(:after_school, name: "AS Program 1")
      @as2 = FactoryGirl.create(:after_school, name: "AS Program 2")
    end

    def delete_after_schools
      @as1.delete
      @as2.delete
    end
  end
end