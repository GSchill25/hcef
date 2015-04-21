module Contexts
  module EnrollmentContexts
  	def create_enrollments
  		@enrollment1 = FactoryGirl.create(:enrollment, date_enrolled: 10.days.ago, program: @program1, child: @child1)
  		@enrollment2 = FactoryGirl.create(:enrollment, date_enrolled: 5.days.ago, program: @program2, child: @child2)
  		@enrollment3 = FactoryGirl.create(:enrollment, date_enrolled: 2.days.ago, program: @program3, child: @child3)
  	end

  	def delete_enrollments
  		@enrollment1.delete
  		@enrollment2.delete
  		@enrollment3.delete
  	end
  end
end