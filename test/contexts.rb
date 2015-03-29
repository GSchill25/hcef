# require needed files
require './test/sets/after_schools_contexts'
require './test/sets/assignment_contexts'
require './test/sets/child_contexts'
require './test/sets/child_location_contexts'
require './test/sets/enrichment_contexts'
require './test/sets/enrollment_contexts'
require './test/sets/field_trip_contexts'
require './test/sets/guardian_contexts'
require './test/sets/instructor_contexts'
require './test/sets/location_contexts'
require './test/sets/program_contexts'
require './test/sets/provider_contexts'
require './test/sets/school_contexts'
require './test/sets/sub_location_contexts'
require './test/sets/user_contexts'

module Contexts
	#include all Contexts
	include Contexts::AfterSchoolContexts
	include Contexts::AssignmentContexts
	include Contexts::ChildContexts
	include Contexts::ChildLocationContexts
	include Contexts::EnrichmentContexts
	include Contexts::EnrollmentContexts
	include Contexts::FieldTripContexts
	include Contexts::GuardianContexts
	include Contexts::InstructorContexts
	include Contexts::LocationContexts
	include Contexts::ProgramContexts
	include Contexts::ProviderContexts
	include Contexts::SchoolContexts
	include Contexts::SubLocationContexts
	include Contexts::UserContexts
end