module Contexts
  module ChildLocationContexts
  	def create_child_locations
  		@ongoing_cl = FactoryGirl.create(:child_location, start_date: Date.new(2014,7,1), child: @child1, location: @CMU)
  		@finished_cl = FactoryGirl.create(:child_location, start_date: Date.new(2014,7,1), end_date: Date.new(2014,8,1), child: @child3, location: @UPitt)
  	end

  	def delete_child_locations
  		@ongoing_cl.delete
  		@finished_cl.delete
  	end
  end
end