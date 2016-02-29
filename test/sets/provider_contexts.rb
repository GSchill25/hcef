module Contexts
  module ProviderContexts
  	def create_providers
  		@provider1 = FactoryGirl.create(:provider, name: "Provider1")
  		@provider2 = FactoryGirl.create(:provider, name: "Provider2")
  		@provider3 = FactoryGirl.create(:provider, name: "Provider3")
  		@provider4 = FactoryGirl.create(:provider, name: "Provider4")
  	end

  	def delete_providers
  		@provider1.delete
  		@provider2.delete
  		@provider3.delete
  		@provider4.delete
  	end
  end
end