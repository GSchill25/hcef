require 'test_helper'

class EnrichmentDayTest < ActiveSupport::TestCase
  should belong_to(:child)
  should belong_to(:enrichment)
end
