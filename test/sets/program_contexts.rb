module Contexts
  module ProgramContexts
    def create_programs
      # assumes create_curriculums prior
      @program1 = FactoryGirl.create(:program, name: "AfterSchool", start_date: Date.new(2000,7,21), end_date: Date.today, program_type: "after_school", location: @cmu)  
      @program2 = FactoryGirl.create(:program, name: "Enrichment", start_date: Date.new(2000,7,25), end_date: Date.today, program_type: "enrichment", location: @cmu)
      @program3 = FactoryGirl.create(:program, name: "FieldTrip", start_date: Date.new(2000,7,20), end_date: Date.today, program_type: "field_trip", location: @upitt)
      @program4 = FactoryGirl.create(:program, name: "Inactive", start_date: Date.new(2000,7,19), end_date: Date.new(2001,7,22), program_type: "after_school", location: @upitt)
      @program5 - FactoryGirl.create(:program, name: "Upcoming", start_date: 10.days.from_now, end_date: 20.days.from_now, program_type: "enrichment", location: @upitt)
    end

    def delete_programs
      @program1.delete
      @program2.delete
      @program3.delete
      @program4.delete
      @program5.delete
    end
  end
end
