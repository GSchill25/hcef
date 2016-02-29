require 'test_helper'

class EnrichmentTest < ActiveSupport::TestCase
  should belong_to(:provider)
  should belong_to(:program)

  should validate_presence_of(:length)
  should validate_numericality_of(:length)
end
