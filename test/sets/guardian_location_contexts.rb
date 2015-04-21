module Contexts
  module GuardianLocationContexts
  	def create_guardian_locations
  		@gl1 = FactoryGirl.create(:guardian_location, start_date: Date.new(2014,7,1), guardian: @Kim, location: @CMU)
    	@gl2 = FactoryGirl.create(:guardian_location, start_date: Date.new(2014,7,1), guardian: @Lee, location: @CMU)
    	@gl3 = FactoryGirl.create(:guardian_location, start_date: Date.new(2014,7,1), guardian: @Park, location: @UPitt)
  		@finished_gl = FactoryGirl.create(:guardian_location, start_date: Date.new(2014,7,1), end_date: Date.new(2014,8,1), guardian: @Cho, location: @UPitt)
  	end

  	def delete_guardian_locations
  		@gl1.delete
  		@gl2.delete
  		@gl3.delete
  		@finished_gl.delete
  	end
  end
end