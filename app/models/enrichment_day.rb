class EnrichmentDay < ActiveRecord::Base
	belongs_to :child
	belongs_to :enrichment
	
end
