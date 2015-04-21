module Contexts
  module ChildLocationContexts
  	def create_child_locations
  		@cl1 = FactoryGirl.create(:child_location, start_date: Date.new(2014,7,1), child: @child1, location: @CMU)
      @cl2 = FactoryGirl.create(:child_location, start_date: Date.new(2014,7,1), child: @child2, location: @CMU)
      @cl3 = FactoryGirl.create(:child_location, start_date: Date.new(2014,7,1), child: @child3, location: @UPitt)
  		@finished_cl = FactoryGirl.create(:child_location, start_date: Date.new(2014,7,1), end_date: Date.new(2014,8,1), child: @inactive_child, location: @UPitt)
  	end

  	def delete_child_locations
  		@cl1.delete
      @cl2.delete
      @cl3.delete
  		@finished_cl.delete
  	end
  end
end