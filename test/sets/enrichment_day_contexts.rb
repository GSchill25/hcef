module Contexts
  module EnrichmentDayContexts
  	def create_enrichment_days
  		@enrichmentday1 = FactoryGirl.create(:enrichment_day, enrichment: @enrichment1, child: @child1)
  	end

  	def delete_enrichment_days
  		@enrichmentday1.delete
  	end
  end
end