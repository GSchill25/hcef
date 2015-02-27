require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  should have_many(:enrichments)

  should validate_presence_of(:name)
  #test uniqueness
  #test case_sensitive

end
