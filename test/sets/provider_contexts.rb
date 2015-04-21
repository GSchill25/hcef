module Contexts
  module ProviderContexts
  	def create_providers
  		@provider1 = FactoryGirl.create(:provider, name: "Provider")
  	end

  	def delete_providers
  		@provider1.delete
  	end
  end
end