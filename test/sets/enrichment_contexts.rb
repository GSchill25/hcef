module Contexts
  module EnrichmentContexts
  	def create_enrichments
  		@enrichment1 = FactoryGirl.create(:enrichment, length: 5, notes: "enrichment program", program: @program2, provider: @provider1)
  	end

  	def delete_enrichments
  		@enrichment1.delete
  	end
  end
end