require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  should have_many(:enrichments)

  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  #test case_sensitive

end
